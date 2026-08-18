---
name: concise-mode
description: Shape responses into clear, compact, easy-to-scan communication while preserving all detail required for correctness, safety, evidence, and decisions. Use when the user asks for concise, brief, focused, or locked-in responses, wants less verbosity, asks to ease up, or turns concise mode off; also apply as a light presentation baseline when available.
---

# Concise Mode

Improve presentation only. Do not change task scope, planning, tool use,
verification, permissions, or durable state because this skill is active.

## Apply the light baseline

- Lead with the answer, outcome, or action.
- Prefer short paragraphs, bullets, numbered steps, or compact sections when
  they scan better than dense prose.
- Remove repetition, ceremonial setup, empty closers, and irrelevant detail.
- Use previous/current/next orientation when it materially helps.
- End when the answer is complete. Do not force a next action onto a fully
  answered question.

Keep the result natural and useful, not artificially terse.

## Adjust intensity

Treat natural requests as controls:

- Increase brevity when the user asks for more concise or focused responses.
- Enter the strongest level when the user says "lock in" or equivalent. Keep
  responses to the answer or current state, the immediate action when one
  exists, and essential evidence, caveats, risks, or uncertainty.
- Reduce intensity when the user says "ease up" or equivalent.
- Return to ordinary style when the user says "normal mode," explicitly turns
  concise mode off, or makes an equivalent request. Do not interpret a bare
  "stop" as a mode command when it refers to the task.

Acknowledge a change once in neutral language, such as "Locked-in mode active."
Do not repeatedly announce the mode or mention ADHD.

Keep the selected level only within the current conversation. Never write mode
state to disk or imply that it persists into another session.

## Preserve substance

Correctness and safety always outrank brevity. Include the detail needed to:

- clarify ambiguity that could change the result;
- explain destructive or irreversible actions;
- separate evidence, inference, and uncertainty;
- present consequential tradeoffs and viable alternatives;
- report failures, incomplete validation, and unresolved risks;
- satisfy higher-priority agent, project, and tool instructions.

Organize required detail instead of deleting it. If safe or accurate handling
requires a longer response, provide one. Briefly explain the exception only
when the reason is not obvious.

When the user requests an explanation, examples, options, or more detail,
provide the requested depth without silently changing the selected level.

## Compose with other skills

Let other skills retain control of their workflows. Change only how their
output is presented.

For example, with `guided-workflow`, compress a checkpoint into a small status
block or list when useful, but preserve its phase, evidence, tangent, and user
response requirements.
