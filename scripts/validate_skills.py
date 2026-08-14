#!/usr/bin/env python3
"""Structural checks for the skills and plugin manifests in this repository.

Runs without third-party dependencies so contributors can validate the
repository whether or not Codex or Claude Code is installed locally.
"""

from __future__ import annotations

import json
import re
import sys
from pathlib import Path

# The Agent Skills spec fields. Staying inside this set keeps every skill
# loadable by Claude Code, Codex, and claude.ai without edits.
ALLOWED_FRONTMATTER_KEYS = {
    "name",
    "description",
    "license",
    "compatibility",
    "metadata",
    "allowed-tools",
}

NAME_PATTERN = re.compile(r"^[a-z0-9]+(-[a-z0-9]+)*$")
MAX_BODY_LINES = 500
MAX_DESCRIPTION_CHARS = 1024

errors: list[str] = []


def fail(message: str) -> None:
    errors.append(message)


def split_frontmatter(text: str, where: str) -> dict[str, str] | None:
    """Return top-level `key: value` pairs from a leading YAML block.

    Deliberately minimal: skill frontmatter in this repository is a flat map of
    scalars, so a full YAML parser is not required.
    """
    if not text.startswith("---\n"):
        fail(f"{where}: missing YAML frontmatter")
        return None

    end = text.find("\n---", 3)
    if end == -1:
        fail(f"{where}: unterminated YAML frontmatter")
        return None

    fields: dict[str, str] = {}
    key = None
    for line in text[4:end].splitlines():
        if not line.strip() or line.lstrip().startswith("#"):
            continue
        if line[0].isspace():
            if key is None:
                fail(f"{where}: frontmatter starts with an indented line")
                return None
            fields[key] = f"{fields[key]} {line.strip()}".strip()
            continue
        if ":" not in line:
            fail(f"{where}: frontmatter line is not `key: value`: {line!r}")
            return None
        key, _, value = line.partition(":")
        key = key.strip()
        fields[key] = value.strip()
    return fields


def check_skill(skill_dir: Path) -> None:
    where = f"skills/{skill_dir.name}/SKILL.md"
    skill_md = skill_dir / "SKILL.md"

    if not skill_md.is_file():
        fail(f"skills/{skill_dir.name}: SKILL.md is missing")
        return

    text = skill_md.read_text(encoding="utf-8")
    fields = split_frontmatter(text, where)
    if fields is None:
        return

    unexpected = sorted(set(fields) - ALLOWED_FRONTMATTER_KEYS)
    if unexpected:
        fail(f"{where}: frontmatter keys outside the Agent Skills spec: {unexpected}")

    name = fields.get("name", "")
    if not name:
        fail(f"{where}: frontmatter `name` is required")
    elif name != skill_dir.name:
        fail(f"{where}: frontmatter name {name!r} does not match directory name")
    elif not NAME_PATTERN.match(name):
        fail(f"{where}: name {name!r} is not lowercase kebab-case")

    description = fields.get("description", "")
    if not description:
        fail(f"{where}: frontmatter `description` is required")
    elif len(description) > MAX_DESCRIPTION_CHARS:
        fail(f"{where}: description is {len(description)} chars, over {MAX_DESCRIPTION_CHARS}")
    elif "Use when" not in description and "Use this" not in description:
        fail(f"{where}: description states no trigger conditions")

    line_count = len(text.splitlines())
    if line_count > MAX_BODY_LINES:
        fail(f"{where}: {line_count} lines, over the {MAX_BODY_LINES} line limit")

    # Codex reads this for its skill picker. Claude Code ignores it, but a
    # stale file would degrade the Codex experience.
    openai_yaml = skill_dir / "agents" / "openai.yaml"
    if not openai_yaml.is_file():
        fail(f"skills/{skill_dir.name}: agents/openai.yaml is missing (Codex UI metadata)")
        return
    yaml_text = openai_yaml.read_text(encoding="utf-8")
    for required in ("display_name:", "short_description:", "default_prompt:"):
        if required not in yaml_text:
            fail(f"skills/{skill_dir.name}/agents/openai.yaml: missing {required}")
    if f"${skill_dir.name}" not in yaml_text:
        fail(
            f"skills/{skill_dir.name}/agents/openai.yaml: "
            f"default_prompt does not invoke ${skill_dir.name}"
        )


def load_json(path: Path) -> dict | None:
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except FileNotFoundError:
        fail(f"{path.name}: missing")
    except json.JSONDecodeError as exc:
        fail(f"{path.name}: invalid JSON: {exc}")
    return None


def check_manifests(repo_root: Path, skill_names: set[str]) -> None:
    plugin = load_json(repo_root / ".claude-plugin" / "plugin.json")
    marketplace = load_json(repo_root / ".claude-plugin" / "marketplace.json")
    if plugin is None or marketplace is None:
        return

    for field in ("name", "description", "version"):
        if not plugin.get(field):
            fail(f"plugin.json: `{field}` is required")

    for field in ("name", "owner", "plugins"):
        if not marketplace.get(field):
            fail(f"marketplace.json: `{field}` is required")

    entries = marketplace.get("plugins") or []
    entry = next((p for p in entries if p.get("name") == plugin.get("name")), None)
    if entry is None:
        fail(f"marketplace.json: no entry for plugin {plugin.get('name')!r}")
        return

    if entry.get("version") != plugin.get("version"):
        fail(
            "marketplace.json and plugin.json disagree on version: "
            f"{entry.get('version')!r} vs {plugin.get('version')!r}"
        )

    # A marketplace-root source means Claude Code scans ./skills/ for this
    # entry, which is where every skill directory has to live.
    if entry.get("source") != "./":
        fail(f"marketplace.json: entry source is {entry.get('source')!r}, expected './'")
    elif "skills" in entry:
        listed = {Path(p).name for p in entry["skills"]}
        missing = sorted(skill_names - listed)
        if missing:
            fail(f"marketplace.json: entry omits skills {missing}")


def main() -> int:
    repo_root = Path(__file__).resolve().parent.parent
    skills_root = repo_root / "skills"

    skill_dirs = sorted(p for p in skills_root.iterdir() if p.is_dir())
    if not skill_dirs:
        fail("skills/: no skill directories found")

    for skill_dir in skill_dirs:
        check_skill(skill_dir)

    check_manifests(repo_root, {p.name for p in skill_dirs})

    if errors:
        for message in errors:
            print(f"error: {message}", file=sys.stderr)
        return 1

    print(f"validated {len(skill_dirs)} skills and both plugin manifests")
    return 0


if __name__ == "__main__":
    sys.exit(main())
