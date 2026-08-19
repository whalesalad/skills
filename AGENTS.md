# Repository Guidance

This is the public source repository for reusable agent skills. The same
`skills/<name>/SKILL.md` sources ship to Claude Code as a plugin and to Codex
through `scripts/install.sh`. Keep skill instructions concise, generic, safe to
share, and free of anything specific to one agent.

## Start Here

Read these before meaningful work:

1. `README.md` for the repository workflow.
2. `TODO.md` for current priorities.
3. The latest files under `docs/journal/` for recent context.
4. The relevant file under `docs/` when changing an existing skill's behavior.

## Project Continuity

- Use `track-project-journal` for meaningful session evidence when available;
  otherwise update `docs/journal/YYYY-MM-DD*.md` directly.
- Use `manage-project-todo` when actionable state changes; otherwise keep
  `TODO.md` prioritized and current directly.
- Keep the journal as narrative evidence and `TODO.md` as current state.
- Do not rely on chat memory alone for important decisions or next steps.

## Skill Development

- Create each skill as `skills/<name>/SKILL.md`. Both agents depend on that
  path: Claude Code's plugin loader scans `skills/`, and the installer copies
  from it.
- Initialize new skills with the system `skill-creator` scaffolder.
- Keep each `SKILL.md` imperative and under 500 lines.
- Restrict frontmatter to the Agent Skills spec fields so a skill loads
  unchanged on Claude Code, Codex, and claude.ai.
- Put trigger conditions in the YAML description, not a body section.
- Avoid extra files inside a skill unless they directly support its behavior.
- Regenerate `agents/openai.yaml` when its UI metadata no longer matches. Claude
  Code ignores the file; Codex needs it.
- Write skill instructions so they hold on any agent. Refer to agent
  instruction files generally rather than naming only `AGENTS.md`.
- Bump `version` in both `.claude-plugin/plugin.json` and
  `.claude-plugin/marketplace.json` when releasing a behavior change.
- Run `./scripts/check.sh` before committing.
- Run `./scripts/install.sh` only after reviewing the source diff.

## Public Safety

Do not commit secrets, tokens, private keys, private source artifacts,
organization-specific operational details, infrastructure identifiers, or
unnecessary personal information. Use synthetic examples and generic names.
