# 2026-08-18 — Guided workflow skill design

## Summary

Designed a portable `guided-workflow` skill for user-guided, phase-gated
runbooks. The design is ready for user review before implementation.

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

After user review of `docs/guided-workflow-skill-design.md`, initialize the new
skill with the system skill scaffolder, implement the approved behavior, bump
both Claude plugin manifest versions, and run `./scripts/check.sh` plus the
documented scenario review.
