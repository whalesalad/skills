# whalesalad/skills

Reusable agent skills developed from working practices that proved useful
across many kinds of software projects. They follow the
[Agent Skills](https://agentskills.io) format and are supported on both
Claude Code and Codex.

## Guided workflow

`guided-workflow` turns a complex plan or operational runbook into explicit,
user-approved phases. It verifies evidence before advancing, supports flexible
user-agent step ownership, and preserves the main workflow across diagnostic
tangents. Agents may offer the mode when it would help, but it activates only
after the user opts in.

## Resumable project suite

The first three skills separate project continuity into composable concerns:

- `track-project-journal` records the narrative and evidence behind meaningful
  work.
- `manage-project-todo` keeps the current queue prioritized and actionable.
- `bootstrap-resumable-project` scaffolds new repositories or upgrades existing
  ones by composing both practices with concise local guidance.

They are intentionally local-first. Existing repository instructions and
healthy conventions win over the suite's fallback structure.

## Install

### Claude Code

Install as a plugin. Nothing to clone:

```text
/plugin marketplace add whalesalad/skills
/plugin install resumable-project@whalesalad-skills
```

All skills arrive together, invocable as
`/resumable-project:track-project-journal` and so on, or by their bare names
when nothing else claims them. Claude also loads them on its own when a request
matches a skill's description.

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

It copies each reviewed skill directory into `${CODEX_HOME:-~/.codex}/skills`.
Restart Codex or begin a fresh session if the new skills do not appear
immediately.

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

Releasing to Claude Code plugin users additionally requires bumping `version`
in both `.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json`.
Claude Code only offers an update when that field changes; `check.sh` fails if
the two files disagree.

To iterate on the plugin against a local checkout instead of the published
repository:

```sh
claude plugin marketplace add ./            # register this working tree
claude plugin install resumable-project@whalesalad-skills
claude plugin validate .claude-plugin/plugin.json
claude plugin details resumable-project     # confirm all three skills load
```

Re-adding the marketplace from `whalesalad/skills` later replaces the local
entry, since a marketplace name is registered only once per user.

## Layout

```text
skills/<name>/SKILL.md            portable skill instructions
skills/<name>/agents/openai.yaml  Codex UI metadata
.claude-plugin/plugin.json        Claude Code plugin manifest
.claude-plugin/marketplace.json   Claude Code marketplace catalog
CLAUDE.md                         imports AGENTS.md, plus Claude-specific notes
AGENTS.md                         repository guidance for all agents
```

`skills/` is the directory a Claude Code plugin scans by default, and the
installer copies from it for Codex, so one layout serves both.

## Documentation

- [Design](docs/resumable-project-skills-design.md)
- [Provenance](docs/provenance.md)

## Public-safety rule

Keep this repository generic and publishable. Do not commit credentials,
private repository content, organization-specific operational data,
infrastructure identifiers, or personal data that is unnecessary to explain a
reusable practice.

## License

MIT. See [LICENSE](LICENSE).
