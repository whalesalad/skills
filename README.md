# whalesalad/skills

Reusable agent skills developed from working practices that proved useful
across many kinds of software projects. They follow the
[Agent Skills](https://agentskills.io) format and are supported on Claude Code,
Codex, and other compatible hosts.

## Skills

| Skill | Purpose |
|---|---|
| `bootstrap-resumable-project` | Add or improve a local-first journal, TODO tracker, and project continuity workflow. |
| `concise-mode` | Keep responses compact and scannable without dropping details needed for correctness or safety. |
| `guided-workflow` | Work through complex or sensitive tasks in explicit, user-approved phases. |
| `manage-project-todo` | Keep a project's canonical backlog prioritized, current, and actionable. |
| `track-project-journal` | Preserve durable, dated evidence, decisions, findings, and resume points. |

The three resumable-project skills compose around a deliberate split:
`track-project-journal` preserves the story and evidence,
`manage-project-todo` represents current actionable state, and
`bootstrap-resumable-project` establishes both practices. `guided-workflow` and
`concise-mode` are independent workflow and communication tools that can
compose with them or with each other.

All repository-management skills are local-first: existing project
instructions and healthy conventions win over their fallback structures.

## Install

### Claude Code

Install as a plugin. Nothing to clone:

```text
/plugin marketplace add whalesalad/skills
/plugin install resumable-project@whalesalad-skills
```

All skills arrive together in the historically named `resumable-project`
plugin. Invoke one as `/resumable-project:track-project-journal`, for example,
or by its bare name when nothing else claims it. Claude can also load a skill
automatically when a request matches its description.

Update later with `/plugin marketplace update whalesalad-skills`.

To pin the suite to a repository so teammates get it automatically, add it to
that repository's `.claude/settings.json`:

```json
{
  "extraKnownMarketplaces": {
    "whalesalad-skills": {
      "source": { "source": "github", "repo": "whalesalad/skills" }
    }
  },
  "enabledPlugins": { "resumable-project@whalesalad-skills": true }
}
```

### Codex

Clone this repository, then run the installer:

```sh
./scripts/install.sh --codex
```

It copies every reviewed directory under `skills/` into
`${CODEX_HOME:-~/.codex}/skills`. Restart Codex or begin a fresh session if the
new skills do not appear immediately.

### Both, from a clone

```sh
./scripts/install.sh          # every agent home that already exists
./scripts/install.sh --all    # both, creating a missing home
./scripts/install.sh --claude # ${CLAUDE_CONFIG_DIR:-~/.claude}/skills only
```

Installing into `~/.claude/skills` is an alternative to the plugin for anyone
who wants the same copy-from-source workflow on both agents. Use one or the
other, not both.

## Develop

1. Edit a skill under `skills/` in this repository.
2. Run `./scripts/check.sh`.
3. Review the diff.
4. Run `./scripts/install.sh` to promote the source version into the global
   installations.

The source repository is authoritative; globally installed copies are build
outputs.

When a skill's behavior changes, releasing to Claude Code plugin users also
requires bumping `version` in both `.claude-plugin/plugin.json` and
`.claude-plugin/marketplace.json`. Claude Code only offers an update when that
field changes; `check.sh` fails if the two files disagree. Documentation-only
changes do not require a plugin release.

To iterate on the plugin against a local checkout instead of the published
repository:

```sh
claude plugin marketplace add ./            # register this working tree
claude plugin install resumable-project@whalesalad-skills
claude plugin validate .claude-plugin/plugin.json
claude plugin details resumable-project     # confirm every skill loads
```

Re-adding the marketplace from `whalesalad/skills` later replaces the local
entry, since a marketplace name is registered only once per user.

## Layout

```text
skills/<name>/SKILL.md            portable skill instructions
skills/<name>/agents/openai.yaml  Codex UI metadata
.claude-plugin/plugin.json        Claude Code plugin manifest
.claude-plugin/marketplace.json   Claude Code marketplace catalog
scripts/install.sh                copy skills into Codex and/or Claude homes
scripts/check.sh                  run portable and host-specific validation
CLAUDE.md                         imports AGENTS.md, plus Claude-specific notes
AGENTS.md                         repository guidance for all agents
```

`skills/` is the directory a Claude Code plugin scans by default, and the
installer copies from it for Codex, so one layout serves both.

## Design and history

- [Resumable-project suite design](docs/resumable-project-skills-design.md)
- [Guided-workflow design](docs/guided-workflow-skill-design.md)
- [Concise-mode design](docs/concise-mode-skill-design.md)
- [Resumable-project provenance](docs/provenance.md)
- [Project journal](docs/journal/README.md)

## Public-safety rule

Keep this repository generic and publishable. Do not commit credentials,
private repository content, organization-specific operational data,
infrastructure identifiers, or personal data that is unnecessary to explain a
reusable practice.

## License

MIT. See [LICENSE](LICENSE).
