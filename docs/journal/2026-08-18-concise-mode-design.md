# 2026-08-18 — Concise mode skill design

## Summary

Designed and implemented a portable `concise-mode` skill that provides a light
communication baseline, a stronger locked-in mode, and normal/off control.

## Decisions

- Keep the skill presentation-only. It does not manage tasks, park tangents,
  create state, or change execution behavior.
- Use neutral concise, brevity, and locked-in language rather than labeling the
  user or exposing an ADHD framing.
- Preserve all detail required for correctness, safety, evidence, uncertainty,
  and consequential decisions.
- Prefer bullets, numbered steps, and compact sections when they scan better
  than a large paragraph.
- Keep mode selection conversational and session-local, with a one-line
  acknowledgment only when the level changes.
- Let other skills retain workflow ownership. Concise mode may compress their
  presentation but not remove required content or gates.
- Accept best-effort implicit discovery for the light baseline rather than
  modifying global user instruction files.

## External design input

Reviewed the README and skill source in the public `ayghri/i-have-adhd`
repository. Its action-first writing, direct errors, scannable steps, and
low-preamble approach informed the principles. The proposed skill is
independently authored and deliberately omits identity framing, task
management, mandatory estimates, rigid list caps, and forced next actions.

## Validation and installation

The implementation lives at `skills/concise-mode/SKILL.md` with matching Codex
UI metadata. Both Claude plugin manifests were bumped from `0.2.0` to `0.3.0`,
and the README introduces the new capability.

`./scripts/check.sh` validated all five skills and both plugin manifests; every
skill passed Codex structural validation and all repository checks passed.
`./scripts/install.sh --all` installed source-matching copies into both local
Codex and Claude skill directories.

## Resume point

Push the implementation to draft PR #5 and dogfood the mode in fresh Codex and
Claude sessions.
