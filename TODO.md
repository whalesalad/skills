# Skills TODO

Current work is ordered by priority. Keep active items concise and move finished
work to Done.

## Active / Next

- [ ] Confirm `/plugin marketplace add whalesalad/skills` resolves from GitHub,
  then verify that `claude plugin details resumable-project` lists all five
  skills. The local-directory marketplace path is already validated.
- [ ] Verify implicit trigger discovery for all five installed skills in fresh
  Codex and Claude Code sessions; record any concrete discovery failures by
  skill and host.

## Later

- [ ] Add realistic forward-test fixtures when the suite gains behavior that
  cannot be covered by structural and scenario review alone.
- [ ] Consider `claude plugin eval` cases once the suite has behavior worth
  scoring against a no-plugin baseline.

## Done

- [x] Reconciled the repository documentation and backlog after PRs #3–#5
  merged, including a complete five-skill catalog and current installation and
  validation guidance.
- [x] Implemented and locally installed the presentation-only `concise-mode`
  skill with a light baseline, adjustable brevity, safety exceptions, and
  guided-workflow composition. See `docs/concise-mode-skill-design.md`.
- [x] Implemented and locally installed the `guided-workflow` skill for Codex
  and Claude Code, with explicit opt-in, phase checkpoints, flexible ownership,
  tangent recovery, and user controls. See
  `docs/guided-workflow-skill-design.md`.
- [x] Added Claude Code support: `skills/` layout, plugin and marketplace
  manifests, dual-target installer, and an agent-independent validator.
- [x] Merged PR #2 with the initial resumable-project skill suite.
- [x] Distilled the journal, TODO, and resumable-project practices into a
  public-safe design.
- [x] Established the `whalesalad/skills` source workspace and validation flow.
- [x] Implemented and structurally validated `track-project-journal`,
  `manage-project-todo`, and `bootstrap-resumable-project`.
- [x] Installed source-matching copies of all three skills into the global Codex
  skills directory.
- [x] Created the public `whalesalad/skills` repository and published the suite
  as draft PR #2.
