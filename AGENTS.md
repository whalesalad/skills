# Repository Guidance

This is the public source repository for reusable Codex skills. Keep skill
instructions concise, generic, and safe to share.

## Start Here

Read these before meaningful work:

1. `README.md` for the repository workflow.
2. `TODO.md` for current priorities.
3. The latest files under `docs/journal/` for recent context.
4. `docs/resumable-project-skills-design.md` when changing the resumable-project
   suite's behavior.

## Project Continuity

- Use `track-project-journal` for meaningful session evidence when available;
  otherwise update `docs/journal/YYYY-MM-DD*.md` directly.
- Use `manage-project-todo` when actionable state changes; otherwise keep
  `TODO.md` prioritized and current directly.
- Keep the journal as narrative evidence and `TODO.md` as current state.
- Do not rely on chat memory alone for important decisions or next steps.

## Skill Development

- Initialize new skills with the system `skill-creator` scaffolder.
- Keep each `SKILL.md` imperative and under 500 lines.
- Put trigger conditions in the YAML description, not a body section.
- Avoid extra files inside a skill unless they directly support its behavior.
- Regenerate `agents/openai.yaml` when its UI metadata no longer matches.
- Run `./scripts/check.sh` before committing.
- Run `./scripts/install.sh` only after reviewing the source diff.

## Public Safety

Do not commit secrets, tokens, private keys, private source artifacts,
organization-specific operational details, infrastructure identifiers, or
unnecessary personal information. Use synthetic examples and generic names.
