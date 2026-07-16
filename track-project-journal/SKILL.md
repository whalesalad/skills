---
name: track-project-journal
description: Maintain durable, dated project journal entries that preserve changes, evidence, decisions, findings, risks, and resume points across work sessions. Use when asked to log or capture today's work, document a session, add or update a file under docs/journal or another local journal path, create a dated topic breakout, or establish a project journal practice.
---

# Track Project Journal

Maintain the project's narrative evidence trail. Preserve local conventions and
record only supported facts.

## Follow the workflow

1. Locate the repository root. Prefer `git rev-parse --show-toplevel`; otherwise
   use the clearly identified project directory.
2. Read applicable `AGENTS.md` files, journal guidance, and recent entries.
3. Inspect evidence relevant to this session: the conversation, scoped working
   tree changes, relevant commits, commands, test output, and observations.
4. Choose the journal file using the rules below.
5. Write a concise entry that lets someone resume after days or weeks away.
6. Review the diff for unsupported claims, secrets, duplication, and accidental
   changes to earlier entries.

Do not attribute unrelated pre-existing working-tree changes to the current
session.

## Choose the file

Follow a repository-defined path and naming scheme when present. Otherwise use:

```text
docs/journal/YYYY-MM-DD.md
```

Use the user's current local date. If today's file exists, append a distinct
session section; never overwrite earlier content.

Use `docs/journal/YYYY-MM-DD-topic-slug.md` when one substantial,
self-contained topic would overwhelm the daily entry. Keep the slug short,
lowercase, and hyphenated. Append small follow-ups instead of fragmenting the
journal. When a base entry and topic breakouts coexist, cross-link them where
useful and treat all dated variants as that day's record.

Follow an established same-day pattern if the repository already uses one.

## Write useful content

Include only sections supported by the work. Capture relevant items such as:

- What changed.
- Verification, including commands and observed results when useful.
- Decisions and rationale.
- Root causes or important findings.
- Commands or procedures worth remembering.
- Unresolved risks, blockers, or explicit unknowns.
- Concrete next steps and the best resume point.

For conclusions based on transient or external state, preserve enough
provenance to reproduce them: the command, query, or source; when it was checked
if relevant; and the observed result.

Prefer compact tables, pass/fail criteria, exact facts, and short prose over a
session transcript. Omit empty boilerplate sections. State when no tests were
run and why if that fact matters to the handoff.

## Keep the boundary clear

Treat the journal as the story and evidence, not the canonical backlog or a
replacement for durable reference documentation.

- Do not modify `TODO.md` or another tracker unless the user also requests TODO
  management or a composing skill requires it.
- Point to durable plans, references, decisions, or issues rather than copying
  them wholesale.
- Suggest promoting a durable fact elsewhere when appropriate, but do not
  broaden a journal-only request into unrelated documentation work.

## Preserve integrity

- Follow repository-local instructions over this fallback.
- Never fabricate changes, validation, decisions, or external observations.
- State incomplete evidence and uncertainty plainly.
- Never include credentials, tokens, private keys, or sensitive command output.
- Do not write into an arbitrary directory when the target project is unclear.
- Report the journal file changed and summarize the evidence captured.
