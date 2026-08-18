# 2026-08-18 — Guided workflow skill design

## Summary

Designed and implemented a portable `guided-workflow` skill for user-guided,
phase-gated runbooks.

## Decisions

- Use one adaptive skill rather than separate planner and runner skills.
- Let the skill offer itself when a task would benefit, but require user opt-in
  before it changes the execution cadence.
- Require a user response at every phase boundary, including after an
  agent-owned action.
- Default actions to the user while allowing user, agent, or shared ownership.
- Preserve unexpected work as labeled tangents with an explicit return point.
- Keep short workflows conversational and use durable project artifacts only
  when requested or already required by repository convention.
- Expose pause, resume, status, revise, and stop controls so the skill's
  influence remains visible and optional.

## Evidence

The design was derived from a private planning note and refined through
explicit user approval of the activation, checkpoint, ownership, tangent,
recovery, and validation behavior. The source note and its private prose were
not copied into the public repository.

## Resume point

The approved design was implemented at `skills/guided-workflow/SKILL.md` with
matching Codex UI metadata. Both Claude plugin manifests were bumped from
`0.1.0` to `0.2.0`, and the README now introduces the new capability.

## Validation and installation

```sh
./scripts/check.sh
```

Observed: the portable validator accepted all four skills and both plugin
manifests, every skill passed Codex structural validation, and all repository
checks passed. Manual scenario review confirmed that the instructions cover
offer versus activation, user and agent ownership, failed evidence, tangents,
plan revision, pause/resume/stop, durable state, and final acknowledgment.

```sh
./scripts/install.sh --all
```

Observed: source copies of all four skills, including `guided-workflow`, were
installed into both the local Codex and Claude skill directories.

## Resume point

Published the implementation as draft PR #4. Dogfood the installed skill in
fresh Codex and Claude sessions, then capture concrete friction as follow-up
changes rather than guessing beyond the approved first version.
