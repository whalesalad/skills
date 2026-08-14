---
name: bootstrap-resumable-project
description: Scaffold a new repository or upgrade an existing one with a local-first resumable-work system built around concise AGENTS.md guidance, a dated project journal, a prioritized TODO tracker, and optional handoff or documentation structure. Use when asked to make a project resumable, apply journal and TODO tracking, bootstrap a repository in this working style or flavor, improve project continuity, or patch an existing repository's session workflow.
---

# Bootstrap Resumable Project

Establish the smallest durable system that lets work resume after a long gap.
Preserve healthy local conventions and compose the sibling journal and TODO
skills.

## Load the component skills

Before editing, use `track-project-journal` and `manage-project-todo` when they
are available. If direct skill invocation is unavailable, read the complete
sibling files at `../track-project-journal/SKILL.md` and
`../manage-project-todo/SKILL.md`. Apply their procedures instead of duplicating
or weakening them.

If either component is unavailable, continue with the compatible fallback in
this skill and report the missing component.

## Audit before patching

1. Locate the repository root and read all applicable instructions.
2. Inspect existing agent instruction files (`AGENTS.md`, `CLAUDE.md`,
   `.claude/rules/`, or another agent's equivalent), current trackers, recent
   journal entries, handoff files, documentation indexes, and recent relevant
   history.
3. Classify the request as a new-project scaffold or an existing-project
   upgrade.
4. Identify the actual continuity gaps. Do not assume every supported artifact
   is needed.
5. Patch the smallest coherent set of files.
6. Use the TODO component to establish or reconcile current work.
7. Use the journal component to record the scaffold or upgrade work that
   actually occurred.
8. Review the complete diff and report the resulting resume path.

## Scaffold a new project

Normally establish:

- A concise agent-instructions section explaining session start, journal, and
  TODO behavior.
- `TODO.md` as the prioritized current-state tracker.
- `docs/journal/README.md` describing the local journal convention.
- A dated journal entry for meaningful scaffold work actually performed.

Mention `track-project-journal` and `manage-project-todo` by exact name, then
state the plain-language fallback so collaborators without the skills can still
follow the repository contract.

Seed only facts, tasks, and decisions supported by the project request. Do not
invent history or speculative backlog items.

## Upgrade an existing project

- Preserve established paths, formats, terminology, and useful instructions.
- Add missing workflow connections instead of replacing the documentation
  system.
- Avoid restating guidance that already exists.
- Reconcile existing journal and tracker practices before adding new files.
- Keep unrelated user changes untouched.
- Record the upgrade as current work; do not manufacture historical entries.

Examples of useful connections include reading the current tracker and recent
journal entries at session start, journaling meaningful work in the same change,
and updating TODO when actionable state changes.

## Add optional structure only when justified

Add `HANDOFF.md` only when stable orientation material is needed beyond the
latest journal plus tracker, such as a complex repo map, environment bootstrap,
or long-running execution state. Keep it concise and avoid duplicating either
component.

Introduce documentation categories only when real content benefits:

- `docs/reference/` for durable facts.
- `docs/decisions/` for recommendations, tradeoffs, and chosen direction.
- `docs/archive/` for superseded or raw material.
- `docs/journal/` for time-bound work and evidence.

Do not create empty directories or migrate content merely to fit this taxonomy.

## Place agent instructions where every agent reads them

Follow the repository's existing arrangement when one exists. Otherwise write
the shared contract once in `AGENTS.md`, then bridge it to any agent that does
not read that filename:

- Claude Code reads `CLAUDE.md`, not `AGENTS.md`. Create a `CLAUDE.md`
  containing the line `@AGENTS.md` so both files stay in sync from one source.
  Add Claude-specific guidance below the import only when it exists.
- Codex reads `AGENTS.md` directly and needs no bridge.

Never maintain the same guidance in two files by hand. If a repository already
has a populated `CLAUDE.md` and no `AGENTS.md`, extend `CLAUDE.md` in place
rather than splitting its contents.

## Keep the guidance concise

Adapt, rather than paste, guidance equivalent to:

- At session start, read the canonical tracker and latest dated journal entries
  needed to rebuild context.
- Use `track-project-journal` for meaningful session evidence when available;
  otherwise maintain the repository's dated journal directly.
- Use `manage-project-todo` when actionable state changes; otherwise keep the
  canonical tracker prioritized and current directly.
- Keep important context and next steps in repository artifacts, not chat memory
  alone.
- Follow repository-local conventions over global fallback structure.

Do not make journaling mandatory for trivial reads or no-change conversations.

## Preserve integrity

- Follow local instructions over this fallback.
- Proceed with ordinary additive scaffolding within the user's requested scope.
- Stop for direction before destructive, ambiguous, or broad content migrations.
- Never overwrite healthy conventions or unrelated work.
- Never add unsupported project facts, fake validation, or sensitive material.
- Verify links and paths introduced by the patch.
- End with a clear resume sequence naming the tracker, latest journal location,
  and any handoff or index file that matters.
