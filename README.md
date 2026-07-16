# whalesalad/skills

Reusable Codex skills developed from working practices that proved useful
across many kinds of software projects.

## Resumable project suite

The first three skills separate project continuity into composable concerns:

- `track-project-journal` records the narrative and evidence behind meaningful
  work.
- `manage-project-todo` keeps the current queue prioritized and actionable.
- `bootstrap-resumable-project` scaffolds new repositories or upgrades existing
  ones by composing both practices with concise local guidance.

They are intentionally local-first. Existing repository instructions and
healthy conventions win over the suite's fallback structure.

## Install

From this repository:

```sh
./scripts/install.sh
```

The installer copies the reviewed skill directories into
`${CODEX_HOME:-~/.codex}/skills`. Restart Codex or begin a fresh session if the
new skills do not appear immediately.

## Develop

1. Edit a skill in this repository.
2. Run `./scripts/check.sh`.
3. Review the diff.
4. Run `./scripts/install.sh` to promote the source version into the global
   Codex installation.

The source repository is authoritative; globally installed copies are build
outputs.

## Documentation

- [Design](docs/resumable-project-skills-design.md)
- [Provenance](docs/provenance.md)

## Public-safety rule

Keep this repository generic and publishable. Do not commit credentials,
private repository content, organization-specific operational data,
infrastructure identifiers, or personal data that is unnecessary to explain a
reusable practice.

## License

MIT. See [LICENSE](LICENSE).
