---
name: manage-project-todo
description: Maintain a project's canonical TODO or backlog as a prioritized, actionable representation of current state. Use when asked to add, complete, triage, reorder, reconcile, clean up, or create project tasks; update TODO.md or another local tracker; capture where work left off; or establish a repository TODO practice.
---

# Manage Project TODO

Keep the project's current queue accurate and executable. Preserve local
structure and avoid turning the tracker into a changelog.

## Follow the workflow

1. Locate the repository root and read applicable `AGENTS.md` files.
2. Identify the repository-defined canonical tracker. Prefer it over `TODO.md`.
3. Inspect only the project state needed for the request: relevant journal or
   handoff notes, plans, issues, diffs, commits, and validation evidence.
4. Reconcile requested changes with existing items before adding anything.
5. Make the smallest update that accurately represents current state.
6. Review the diff for duplicates, lost context, accidental reprioritization,
   unsupported completion claims, and unrelated edits.

Use `TODO.md` as the fallback path. Create a tracker only when the user asks to
establish one or when a composing skill requires it.

## Maintain the queue

- Keep active or next work near the top in meaningful priority order.
- Add newly discovered follow-ups only when they are relevant and actionable.
- Complete, move, merge, or clarify an existing item instead of duplicating it.
- Separate blocked or waiting work when that distinction helps execution.
- Move lower-priority ideas out of the immediate queue.
- Preserve a concise Done section when the repository uses one.
- Record an unblock condition for blocked work when known.
- Include current state, next action, dependency, or acceptance criteria when
  they materially improve execution.
- Link to durable plans, decisions, issues, or journal evidence instead of
  embedding full history.

Preserve established headings, checkbox style, identifiers, ordering semantics,
and level of detail. When no format exists, use only the fallback sections the
project needs: Active / Next, Blocked / Waiting, Later / Backlog, and Done.

## Keep tasks actionable

Write items so the next session can tell what to do and when the item is done.
Prefer a specific next action over a broad aspiration. Preserve important
context, but trim stale narrative that no longer affects execution.

When completing an item, retain the date, verification, outcome, or evidence
link if the local tracker uses completion history. Do not mark an item complete
merely because work started or a partial implementation exists.

## Keep the boundary clear

Treat the tracker as current state, not the full story.

- Do not create a journal entry unless the user also requests journaling or a
  composing skill requires it.
- Do not mirror an external issue tracker into a local file unless repository
  instructions or the user explicitly call for that workflow.
- Do not silently replace user-owned priority decisions.

## Preserve integrity

- Follow repository-local instructions over this fallback.
- Never invent tasks, dependencies, acceptance criteria, or completion proof.
- Do not discard blocked or incomplete work silently.
- Surface contradictions between the tracker and repository evidence.
- Preserve unrelated user content and working-tree changes.
- Report the tracker changed and summarize additions, completions, and priority
  changes.
