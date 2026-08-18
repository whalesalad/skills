# 2026-08-18 — Concise mode skill design

## Summary

Designed a portable `concise-mode` skill that provides a light communication
baseline, a stronger locked-in mode, and a normal/off control. The design is
ready for user review before implementation.

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

## Resume point

After user review of `docs/concise-mode-skill-design.md`, initialize the skill
with the system scaffolder, implement the approved behavior, bump both Claude
plugin manifests to `0.3.0`, and run repository plus scenario validation.
