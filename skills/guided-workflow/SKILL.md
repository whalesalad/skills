---
name: guided-workflow
description: Guide complex, sequential, or operationally sensitive work through explicit user-approved phases with evidence checks, flexible user-agent step ownership, recoverable tangents, and pause/resume controls. Use when the user asks to be walked through work, requests one step at a time, invokes guided workflow, or is about to begin a multi-phase task that may benefit from a runbook; in the latter case offer the mode once and wait for opt-in rather than activating it automatically.
---

# Guided Workflow

Keep the user oriented and in control while working through a runbook one
verified phase at a time.

## Enter the mode

- Activate directly when the user explicitly requests guided workflow,
  step-by-step guidance, or equivalent checkpointed execution.
- For a likely candidate task, offer guided workflow once and wait. Do not
  change the cadence, create artifacts, or keep offering unless the user opts
  in.
- On activation, name the overall goal and say that `pause`, `resume`,
  `status`, `revise`, and `stop` are available in natural language.

## Establish the runbook

Derive ordered phases from an existing plan or propose a concise outline.
Track:

- overall goal;
- completed and remaining phases;
- current phase and immediate action;
- action owner: user, agent, or shared;
- evidence required to pass;
- active tangent and its return checkpoint;
- status: active, paused, blocked, or complete.

Show enough of the outline to preserve orientation, but give actionable detail
only for the current phase. Obtain agreement before materially changing phase
order, scope, or success criteria.

## Run one checkpoint at a time

For each phase:

1. State the phase purpose and exactly one next action.
2. Name the owner and the evidence that will show success.
3. Perform the action only when it belongs to the agent and is authorized;
   otherwise wait for the user to act.
4. Present or receive the result, then wait for a user response before
   advancing, including after an agent-owned action.
5. Evaluate the evidence. Advance only when it satisfies the success condition.

Keep checkpoint updates compact: what completed, what the evidence shows,
where the workflow is now, and the one next action. If evidence is incomplete,
ambiguous, or concerning, remain on the phase and help diagnose it.

Default ownership to the user, but divide work naturally when the user
delegates or when shared execution is useful. Changing ownership never removes
the checkpoint. Do not treat this skill as authority for destructive actions,
external writes, or expanded scope.

## Preserve tangents

When unexpected work interrupts a phase:

1. Keep the phase open and label the tangent.
2. Save the exact return checkpoint.
3. Resolve, abandon, or escalate the tangent explicitly, using checkpointed
   steps when useful.
4. Summarize its effect and return to the saved checkpoint.

Track nested tangents as a small stack only when necessary. Do not let a side
path silently replace the overall goal.

## Honor controls

- On **pause**, preserve the current state and stop issuing actions.
- On **resume**, restate the goal, verified progress, current checkpoint,
  tangent state, and immediate next action.
- On **status**, report that same compact state without advancing.
- On **revise**, discuss and agree on material changes before applying them.
- On **stop**, exit the mode and state any incomplete or risky condition that
  should not be lost.

Accept equivalent natural language; never require literal commands.

## Preserve durable state when useful

Keep short workflows conversational. Reuse an existing plan, runbook, journal,
or tracker when project instructions already make it authoritative.

For long or cross-session work, suggest recording the state. Create or modify
an artifact only with user agreement or when an established project convention
already requires it. Record the goal, phases, current checkpoint, verified
evidence, tangent, unresolved risks, and next action; do not invent a new file
format by default.

## Complete deliberately

Treat final verification as a checkpoint. Present its evidence and wait for
the user's acknowledgment before declaring the workflow complete.
