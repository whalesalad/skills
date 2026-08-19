# 2026-08-18 — Repository refresh

## Summary

Reconciled repository documentation and current-state tracking after PRs 3, 4,
and 5 merged. The repository now presents all five shipped skills as one
collection while retaining the existing `resumable-project` Claude plugin ID
for compatibility.

## What changed

- Replaced the README's feature-by-feature introduction with a complete
  five-skill catalog and clarified how the skills compose.
- Clarified that the Claude plugin's name is historical, that all skills ship
  together, and that the installer discovers every reviewed directory under
  `skills/`.
- Expanded the README's development, layout, and design-documentation guidance.
- Generalized contributor instructions to consult the relevant skill design
  instead of always pointing at the resumable-project suite design.
- Reconciled `TODO.md` with merged work and updated remaining marketplace and
  implicit-discovery checks to cover all five skills.

## Decisions

- Keep the `resumable-project` plugin and marketplace identifiers stable. The
  name predates the two independent skills, but changing it would disrupt the
  documented installation and upgrade path without improving functionality.
- Do not bump the plugin version for documentation-only changes. Both manifests
  remain aligned at `0.3.0`, and no shipped skill behavior changed.
- Leave the installer and validator unchanged because both already discover
  the skill tree dynamically and validate the complete current inventory.

## Validation

```sh
./scripts/check.sh
```

Observed: all five skills and both plugin manifests passed portable validation;
all five skills passed the locally available Codex validator; placeholder,
private-path, whitespace, and shell-syntax checks passed.

## Resume point

The remaining external checks are current in `TODO.md`: validate the GitHub
marketplace installation path and exercise implicit discovery for all five
skills in fresh Codex and Claude Code sessions.
