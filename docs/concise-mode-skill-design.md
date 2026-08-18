# Concise Mode Skill Design

## Purpose

Add a portable `concise-mode` skill that reduces cognitive load through clear,
compact presentation while preserving every detail needed for correctness,
safety, and sound decisions.

The skill is a user-controlled communication aid. It must not diagnose or label
the user, manage tasks, suppress work, create state files, change permissions,
or alter how the agent executes a task. The same
`skills/concise-mode/SKILL.md` source must work unchanged in Claude Code and
Codex.

## Design Input

The design draws general inspiration from the public
[`ayghri/i-have-adhd`](https://github.com/ayghri/i-have-adhd) project, especially
its emphasis on action-first writing, scannable steps, direct error reporting,
and removing low-value preamble. This implementation is independently written
and intentionally differs in identity framing, scope, controls, and rules.

## Boundaries

Concise mode changes presentation only. It may:

- Lead with an answer, result, or action.
- Replace a dense paragraph with a short list or small sections.
- Remove repetition, ceremonial setup, empty closers, and irrelevant detail.
- Make relevant previous/current/next orientation easy to scan.

It must not:

- Add, remove, reorder, defer, or park tasks.
- Create or update plans, journals, trackers, notes, or other state merely
  because the mode is active.
- Hide tangents, risks, uncertainty, evidence, alternatives, or unfinished work
  that materially affect the answer.
- Shorten tool use, verification, analysis, or implementation at the expense of
  quality.
- Mention ADHD or characterize why the user prefers this presentation.

## Modes

### Light baseline

Use this as the intended default when the installed skill is discovered:

- Lead with the outcome or direct answer.
- Prefer short paragraphs, bullets, numbered steps, or compact sections when
  they scan better than prose.
- Avoid restating information the user already has.
- Include temporal orientation only when it helps the current task.
- End naturally when the answer is complete.

The baseline should feel edited and clear, not artificially terse.

Skill discovery is heuristic in both supported agents. A portable skill cannot
guarantee that its body is loaded for every unrelated conversation merely by
being installed. The first release accepts this limitation and uses broad,
accurate trigger metadata rather than modifying global user instructions.

### Locked-in

Activate the strongest presentation mode when the user says "lock in," asks to
crank up brevity, or expresses an equivalent preference. Normally include only:

- The answer, result, or current state.
- The immediate action when one exists.
- Essential evidence, caveats, risks, or uncertainty.

Do not force a next action onto a question that is already fully answered.
Withhold optional background until requested, but never withhold material
context.

### Normal or off

Return to the agent's ordinary communication style when the user disables the
mode. Do not interpret a bare "stop" as a mode command when it naturally refers
to the current task.

Mode selection lasts only within the current conversation. Never write it to
disk or imply that it persists across sessions.

## Controls and Feedback

Accept natural phrasing rather than requiring literal commands. Examples
include:

- "Be more concise" or "increase brevity" to tighten the current level.
- "Lock in" for the strongest level.
- "Ease up" to reduce intensity.
- "Normal mode" or "turn concise mode off" to disable it.

Acknowledge a mode change in one neutral line, such as "Locked-in mode active."
Do not repeatedly announce the mode or label ordinary responses.

A request for explanation, examples, alternatives, or more detail temporarily
expands the relevant answer without silently changing the selected mode.

## Safety and Information Integrity

Correctness and safety always outrank brevity. Preserve the detail needed to:

- Explain destructive or irreversible actions.
- Request clarification when ambiguity could change the result.
- State uncertainty and distinguish evidence from inference.
- Describe consequential tradeoffs and viable alternatives.
- Report failures, incomplete validation, and unresolved risk.
- Meet higher-priority agent, project, or tool instructions.

When required detail makes a response longer than the selected mode normally
allows, provide it. Briefly explain the exception only when the reason would
not otherwise be obvious.

Conciseness must come from organization and editing, never from manufacturing
confidence or deleting the substance of the answer.

## Composition

Other skills retain ownership of their workflows. Concise mode changes only
how their output is presented.

With `guided-workflow`, for example, guided workflow still controls phases,
evidence gates, tangents, and completion. Concise mode may compress a checkpoint
into a small status block or bullet list but must not remove its required
evidence or user response gate.

## Packaging

Add the skill through the shared cross-agent layout:

```text
skills/concise-mode/
  SKILL.md
  agents/openai.yaml
```

Update both Claude plugin manifests from `0.2.0` to `0.3.0`. Codex UI metadata
must describe the same presentation behavior without agent-specific additions
to `SKILL.md`.

## Validation

Run `./scripts/check.sh` and review the implementation against these scenarios:

| Scenario | Required behavior |
|---|---|
| Baseline answer | Lead directly and use a scannable shape without losing context |
| Dense explanation | Prefer compact sections or bullets over a large paragraph |
| Locked-in request | Acknowledge once and tighten subsequent presentation |
| Ease-up request | Reduce intensity without disabling the mode silently |
| Normal/off request | Return to ordinary style and acknowledge once |
| Detailed explanation | Provide requested depth without changing the selected level |
| Ambiguous request | Ask the necessary question instead of guessing concisely |
| Destructive action | Preserve warnings, scope checks, and confirmation requirements |
| Uncertain conclusion | Preserve calibrated uncertainty and supporting evidence |
| Simple factual answer | Answer directly without inventing a next action |
| Guided workflow | Compress presentation without weakening any phase gate |
| New session | Make no claim that a prior conversation's mode persisted |

The implementation is complete when both agents consume the same portable
skill source, both plugin manifests agree at `0.3.0`, repository checks pass,
and scenario review finds no rule that trades correctness, safety, clarity, or
user control for shorter output.
