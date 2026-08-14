@AGENTS.md

## Claude Code specifics

- Skills in this repository are packaged as the `resumable-project` plugin.
  `.claude-plugin/plugin.json` describes it and `.claude-plugin/marketplace.json`
  publishes it. Bump `version` in both files together when skill behavior
  changes; Claude Code only offers updates when that field moves.
- `skills/<name>/` is the layout Claude Code's plugin loader scans. Do not move
  a skill out of that directory without also updating both manifests.
- `agents/openai.yaml` inside each skill is Codex UI metadata. Claude Code
  ignores it. Keep it accurate anyway so Codex stays fully supported.
- Keep `SKILL.md` frontmatter to the Agent Skills spec fields (`name`,
  `description`, `license`, `compatibility`, `metadata`, `allowed-tools`) so
  each skill stays portable across Claude Code, Codex, and claude.ai.
- `claude plugin validate .claude-plugin/plugin.json` warns that this file is
  not loaded as plugin context. That is expected and not worth fixing: the
  plugin source is the repository root, so this contributor guidance ships
  alongside it. Nothing here is meant to reach plugin users.
