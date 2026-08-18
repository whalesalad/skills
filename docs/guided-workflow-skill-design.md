# Guided Workflow Skill Design

## Purpose

Add a portable `guided-workflow` skill for work that benefits from deliberate,
sequential execution. The skill helps a user and agent work through a runbook
one phase at a time, verifies evidence before advancing, and preserves the
overall goal when unexpected work requires a tangent.

The same `skills/guided-workflow/SKILL.md` source must work unchanged in Claude
Code and Codex.

## Activation and Visibility

The skill has two entry paths:

- **Offer mode:** When a task appears multi-phase, sequential, operationally
  sensitive, or likely to benefit from explicit checkpoints, briefly offer
  guided workflow and wait for the user to opt in.
- **Direct activation:** Treat requests such as "use guided workflow," "walk me
  through this," or "do this one step at a time" as consent to activate it.

Offer mode must not restructure the work, create artifacts, or start gated
execution. If the user declines, continue normally and do not repeat the offer
for that task.

On activation, explicitly state that guided workflow is active, identify the
overall goal, and mention the available controls: `pause`, `resume`, `status`,
`revise`, and `stop`. This makes the skill's influence visible and gives the
user a straightforward way to suspend or end it.

## Workflow Model

An active workflow tracks:

- The overall goal.
- Ordered phases and the current phase.
- The owner of the current action: user, agent, or shared.
- The evidence or success condition required to pass the phase.
- The workflow status: active, paused, blocked, or complete.
- Any active tangent and the checkpoint to which it must return.

The agent may derive phases from an existing plan or propose a concise phase
outline. It should expose only enough future detail to preserve orientation;
the current phase receives the actionable detail.

## Phase Checkpoints

Every phase is a hard conversational checkpoint:

1. State the current phase, its purpose, and one concrete next action.
2. State who owns the action and what evidence will establish success.
3. Wait for a response from the user, including when the agent performed the
   action itself.
4. Evaluate the reported or observed evidence.
5. Advance only when the evidence satisfies the phase's success condition.

At a checkpoint, provide a compact update covering what was attempted, what
the evidence shows, whether the phase passed, and exactly one next action.
Incomplete, ambiguous, or concerning evidence keeps the workflow on the
current phase while the agent helps diagnose the result.

Completion is also gated: do not declare the overall workflow complete until
the final verification evidence has been presented to and acknowledged by the
user.

## Step Ownership

User execution is the default, but ownership is deliberately flexible. The
user may delegate a safe action to the agent, the agent may suggest an
efficient division of work, and a phase may be shared.

Changing ownership does not remove the checkpoint. For example, the agent may
run a diagnostic and report its result, then wait for the user before asking
the user to perform the next operational action.

Normal tool-use and repository safety rules still apply. Guided workflow does
not create authority for destructive actions, external writes, or scope
expansion.

## Tangents and Plan Changes

When a phase exposes an unexpected issue:

1. Keep the current phase open.
2. Label the tangent and record its return checkpoint.
3. Work through the tangent using the same one-action, one-response cadence
   when appropriate.
4. Resolve, abandon, or escalate the tangent explicitly.
5. Summarize its effect and return to the saved checkpoint.

Nested tangents may be tracked as a small stack when needed, but avoid ceremony
for a single diagnostic detour.

Reality may require revising the runbook. Show material changes to phases,
order, evidence requirements, or scope and obtain the user's agreement instead
of silently rewriting the workflow.

## Controls

- `pause`: Preserve the goal, current phase, evidence, and tangent state, then
  stop issuing next actions.
- `resume`: Restate the compact saved state and continue from the exact paused
  checkpoint.
- `status`: Report the goal, completed phases, current checkpoint, active
  tangent, and immediate next action without advancing.
- `revise`: Discuss and agree on a material runbook change before applying it.
- `stop`: End guided workflow for the task and state any incomplete or risky
  state that should not be lost.

Equivalent natural-language requests should work; users do not need to use
literal commands.

## Durability

Keep short workflows in the conversation. Reuse an existing project plan,
runbook, journal, or tracker when repository instructions already make it the
durable source of state.

For long-running or cross-session work, suggest recording the workflow state.
Create or modify a project artifact only when the user agrees or an established
repository convention already calls for that update. Do not introduce a new
file format merely because the skill is active.

When durable state is used, record enough to resume: goal, phase list, current
checkpoint, verified evidence, active tangent, unresolved risks, and immediate
next action.

## Communication Style

Keep checkpoint messages concise and easy to scan. Maintain temporal
orientation by distinguishing what has completed, what is happening now, and
what action comes next. Do not bury the requested action in a long explanation.

Guided workflow controls execution cadence, not the user's broader preferred
writing style. A separate skill may provide more aggressive brevity or ADHD
support later.

## Packaging

Add the skill using the repository's shared cross-agent layout:

```text
skills/guided-workflow/
  SKILL.md
  agents/openai.yaml
```

Update both Claude plugin manifests to the same new version when releasing the
behavior change. Codex UI metadata should describe the same behavior without
adding agent-specific requirements to `SKILL.md`.

## Validation

Run `./scripts/check.sh` and review the skill against these scenarios:

| Scenario | Required behavior |
|---|---|
| Candidate task | Offer guided workflow once without activating it |
| Declined offer | Continue normally and do not offer again for the task |
| Explicit request | Activate directly and announce controls |
| User-owned phase | Give one action, wait, and evaluate reported evidence |
| Agent-owned phase | Perform the action when authorized, report, and still wait |
| Failed verification | Remain on the phase and diagnose the evidence |
| Unexpected issue | Enter a labeled tangent and return to the saved checkpoint |
| Material plan change | Show the revision and obtain agreement |
| Pause and resume | Restore the exact goal, phase, tangent, and next action |
| Stop | Exit the mode while preserving important incomplete-state warnings |
| Final phase | Require final evidence and user acknowledgment before completion |
| Long workflow | Reuse or suggest durable state without creating files by default |

The implementation is complete when the portable validator accepts the new
skill, both plugin manifests agree, public-safety scans pass, and scenario
review finds no path that silently activates, advances, rewrites, or completes
the workflow.
