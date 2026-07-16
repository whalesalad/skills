# Resumable Project Skills Design

## Purpose

Create three globally available Codex skills that make project work durable
across sessions without forcing every repository into one rigid template:

- `track-project-journal` maintains a narrative evidence trail.
- `manage-project-todo` maintains the prioritized current state.
- `bootstrap-resumable-project` scaffolds new repositories or upgrades existing
  repositories by composing the other two practices with concise local
  instructions.

The source lives in this repository so the practices can be reviewed, branched,
tested, and improved. Finished skills are installed under `~/.codex/skills` for
global discovery.

## Provenance

These practices were distilled from repeated use across infrastructure,
application, research, data, and operational repositories. The successful
implementations converged on the same principles:

- Work should be resumable after days or weeks away.
- Chat memory is not a durable project artifact.
- A journal preserves the story and evidence behind changes.
- A TODO tracker preserves the current queue and priority order.
- Durable reference material should not be buried in either temporal notes or
  an ever-growing backlog.
- Repository-local instructions should explain how these artifacts work
  together.

This public repository documents only the general method. It does not reproduce
private project content, organization details, infrastructure identifiers,
credentials, costs, or other sensitive source material.

## Shared Design Principles

### Local conventions win

Inspect applicable repository instructions and established files before making
changes. Preserve healthy local paths, formats, terminology, and workflows. Use
the defaults in this design only when a repository has no applicable convention.

### Make the smallest coherent change

Add or update only the artifacts needed to leave the repository more resumable.
Do not replace established documentation systems or create empty structure for
appearance's sake.

### Separate story from state

The journal explains what happened, what was learned, and why decisions were
made. The TODO tracker represents what is actionable now. Cross-link them when
useful, but do not turn either one into a duplicate of the other.

### Preserve evidence without inventing it

Record only commands, tests, observations, changes, and decisions supported by
the current session or repository state. State uncertainty plainly. Never claim
that a validation or external check occurred when it did not.

### Keep public artifacts safe

Do not place secrets, tokens, private keys, credential material, sensitive
outputs, or unnecessary personal and organizational details in journal entries,
TODO items, examples, fixtures, or provenance documentation.

## Skill 1: `track-project-journal`

### Responsibility

Own the narrative evidence trail. Create or append a journal entry without
changing the project backlog unless the user explicitly asks for both skills.

### Discovery

1. Locate the repository root.
2. Read applicable `AGENTS.md` files and any repository-local journal guidance.
3. Inspect recent journal entries to learn the established path and style.
4. Inspect current-session evidence such as the conversation, working-tree
   diff, recent relevant commits, commands, and validation output.

### Default location and naming

Use the repository's established convention when one exists. Otherwise use:

```text
docs/journal/YYYY-MM-DD.md
```

Use the user's current local date. If today's entry exists, append a distinct
session section without overwriting earlier content.

For a substantial, self-contained topic that would overwhelm the daily entry,
use:

```text
docs/journal/YYYY-MM-DD-topic-slug.md
```

Keep the slug short, lowercase, and hyphenated. Append small follow-ups instead
of fragmenting the journal. When a base daily entry and topic breakouts coexist,
cross-link them where useful and treat every dated variant as part of that day's
record.

### Content

Include only sections that add value. Candidate content includes:

- What changed.
- What was verified, including commands and observed results when useful.
- Decisions and their rationale.
- Root causes or important findings.
- Commands or procedures worth remembering.
- Unresolved risks, unknowns, or blockers.
- Concrete next steps and resume points.

For conclusions based on transient or external state, preserve enough
provenance to reproduce them: the command, query, or source; when it was checked
if relevant; and the observed result.

Keep entries concise, factual, and useful to someone resuming after a long
absence. Prefer compact tables, pass/fail criteria, exact facts, and short prose
over a transcript of the session.

### Safety and failure behavior

- Follow local instructions when they conflict with the fallback format.
- Never overwrite an existing entry.
- Never fabricate work, validation, or observations.
- State missing evidence or incomplete validation explicitly.
- Exclude secrets and sensitive output.
- If no repository root can be determined, ask for the target rather than
  writing into an arbitrary directory.

## Skill 2: `manage-project-todo`

### Responsibility

Own the project's prioritized current state. Maintain the canonical tracker
without creating a journal entry unless the user explicitly asks for both
skills.

### Discovery

1. Locate the repository root.
2. Read applicable repository instructions.
3. Identify the repository-defined canonical tracker.
4. Inspect relevant journal, handoff, planning, issue, and implementation state
   needed to update tasks accurately.

Use an established tracker when present. Otherwise default to `TODO.md`, but
create it only when explicitly requested or when invoked by
`bootstrap-resumable-project`.

### Tracker behavior

- Keep active work near the top and preserve meaningful priority order.
- Add newly discovered follow-ups.
- Complete, move, merge, or clarify existing items instead of duplicating them.
- Separate blocked or waiting work when that distinction helps execution.
- Keep later ideas and backlog items out of the immediate queue.
- Retain a concise Done section when the repository uses one.
- Capture current state, next action, dependencies, and acceptance criteria when
  they make an item more executable.
- Link to durable plans, decisions, issues, or journal evidence instead of
  embedding full history in the tracker.

Preserve the repository's established headings, checkbox style, identifiers,
and level of detail. The fallback shape may use Active/Next, Blocked/Waiting,
Later/Backlog, and Done, but those headings are not mandatory.

### Safety and failure behavior

- Do not invent tasks from vague context.
- Do not silently discard incomplete or blocked work.
- Preserve user-owned priority decisions unless new evidence clearly changes
  the state or the user asks for reprioritization.
- Report contradictions between tracker state and repository evidence.
- Avoid turning TODO into a narrative changelog.

## Skill 3: `bootstrap-resumable-project`

### Responsibility

Establish the broader resumable-project operating pattern in a new repository
or strengthen it in an existing repository. Apply the procedures from
`track-project-journal` and `manage-project-todo` when those sibling skills are
available.

### Modes

#### Scaffold a new project

Normally:

- Create or extend `AGENTS.md` with concise session-start and session-close
  guidance.
- Establish `TODO.md` as the prioritized current-state tracker.
- Establish `docs/journal/` and its local convention.
- Mention `track-project-journal` and `manage-project-todo` by name, with a
  plain-language fallback for collaborators without the installed skills.
- Seed only facts and tasks known from the project request.

Do not create fake history or speculative backlog content.

#### Upgrade an existing project

- Audit existing instructions, tracking files, documentation structure, and
  recent practice.
- Preserve established paths, language, and healthy conventions.
- Add missing workflow connections, such as reading the latest journal at
  session start or updating both story and state after meaningful work.
- Avoid duplicating guidance already present.
- Make the smallest additive patch that closes the identified gaps.

### Optional supporting structure

Add `HANDOFF.md` only when a stable orientation guide is needed beyond the
latest journal and TODO tracker. Consider richer documentation categories only
when actual content benefits from them:

- `docs/reference/` for durable facts.
- `docs/decisions/` for recommendations, tradeoffs, and chosen direction.
- `docs/archive/` for superseded or raw material.
- `docs/journal/` for time-bound work and evidence.

Do not create empty directories or migrate established content without a clear
benefit.

### `AGENTS.md` integration

Keep injected guidance concise. It should communicate that agents must:

- Read the current tracker and latest journal entries when rebuilding context.
- Use `track-project-journal` and `manage-project-todo` when available.
- Keep project state in repository artifacts rather than chat memory alone.
- Update the journal after meaningful work and the TODO tracker when actionable
  state changes.
- Follow local repository conventions over global fallback structure.

### Safety and failure behavior

- Local instructions win over global defaults.
- Preserve unrelated user content and working-tree changes.
- Stop for direction before destructive or ambiguous migrations.
- Proceed directly with ordinary additive scaffolding or patching.
- Do not add `HANDOFF.md` or documentation taxonomy merely because the skill
  supports them.

## Execution Flow

Every skill follows this sequence:

1. Locate the target and applicable instructions.
2. Inspect existing conventions and relevant current state.
3. Classify the request.
4. Make the smallest coherent edit.
5. Review the diff for duplication, invented claims, leaked secrets, stale
   links, lost formatting, and unintended files.
6. Report exactly which artifacts changed and what validation was performed.

## Trigger Examples

The skill descriptions must support natural requests such as:

- "Log a journal entry for today."
- "Capture this session in the project journal."
- "Update the TODO with where we left off."
- "Triage and reorder the project backlog."
- "Make this repository resumable."
- "Bootstrap this project in my usual flavor."
- "Upgrade this repo with journal and TODO tracking."

## Packaging

Use one directory per skill:

```text
track-project-journal/
  SKILL.md
  agents/openai.yaml
manage-project-todo/
  SKILL.md
  agents/openai.yaml
bootstrap-resumable-project/
  SKILL.md
  agents/openai.yaml
```

Keep each `SKILL.md` concise and imperative. Do not add scripts unless testing
shows that deterministic automation is needed; repository-aware editing is
primarily a judgment-driven workflow.

Install the three finished skill directories under `~/.codex/skills`. The
repository remains the editable source of truth.

## Validation

Run the skill creator's structural validator for every skill. Review behavior
against fixture repositories covering:

- A blank new repository.
- An existing repository with no tracking conventions.
- A repository already using the fallback pattern.
- A repository with a custom journal path or TODO format.
- Multiple sessions on one date.
- A large topic deserving a dated breakout file.
- Conflicting local instructions.

Validate that no fixture or committed documentation contains sensitive source
material. Since global skill discovery is normally refreshed between Codex
sessions, verify the installed paths immediately and verify trigger discovery
in a fresh session when practical.

## Success Criteria

- All three skills pass structural validation.
- Ordinary language reliably indicates the correct skill.
- Existing repository conventions remain intact.
- Journal entries are evidence-based and resume-friendly.
- TODO files remain prioritized representations of current state.
- The bootstrap skill improves new and existing repositories without bloating
  them.
- The public repository contains no sensitive provenance or project data.
- The source repository and global installation contain the same reviewed skill
  versions.
