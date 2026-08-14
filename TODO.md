# Skills TODO

Current work is ordered by priority. Keep active items concise and move finished
work to Done.

## Active / Next

- [ ] Review and merge draft PR #2 for the initial resumable-project skill
  suite.
- [ ] Push the Claude Code support branch and confirm
  `/plugin marketplace add whalesalad/skills` resolves from GitHub. Only the
  local-directory source has been exercised so far.
- [ ] Verify implicit trigger discovery for all three installed skills in a
  fresh session of each agent, Codex and Claude Code.

## Later

- [ ] Add realistic forward-test fixtures when the suite gains behavior that
  cannot be covered by structural and scenario review alone.
- [ ] Consider `claude plugin eval` cases once the suite has behavior worth
  scoring against a no-plugin baseline.

## Done

- [x] Added Claude Code support: `skills/` layout, plugin and marketplace
  manifests, dual-target installer, and an agent-independent validator.

- [x] Distilled the journal, TODO, and resumable-project practices into a
  public-safe design.
- [x] Established the `whalesalad/skills` source workspace and validation flow.
- [x] Implemented and structurally validated `track-project-journal`,
  `manage-project-todo`, and `bootstrap-resumable-project`.
- [x] Installed source-matching copies of all three skills into the global Codex
  skills directory.
- [x] Created the public `whalesalad/skills` repository and published the suite
  as draft PR #2.
