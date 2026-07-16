# Provenance

## Where the pattern came from

The resumable-project suite emerged from using coding agents across many
long-lived repositories. Some projects involved application development;
others involved infrastructure, operations, research, data analysis, or
hardware. The details differed, but the same failure mode kept appearing:
important state lived in a conversation and became expensive to reconstruct
after a break.

Several repositories independently converged on two complementary artifacts:

- A dated journal that recorded what happened, what was verified, what was
  learned, and why decisions were made.
- A prioritized TODO file that represented what should happen next.

Repositories that also explained this loop in their agent instructions were
consistently easier to resume. The practice worked best when the journal and
TODO remained distinct instead of becoming two copies of the same history.

## What survived repeated use

The useful core was not a mandatory heading template. It was a set of durable
properties:

- Local conventions should win over global preferences.
- Journal entries should be evidence-based and written close to the work.
- TODO items should describe current state and executable next actions.
- Durable facts and decisions should graduate into stable documentation rather
  than remain trapped in temporal notes.
- Large journal topics may use `YYYY-MM-DD-topic-slug.md`; small follow-ups
  should stay with the day's existing record.
- A project should be understandable after weeks away without relying on chat
  memory.

## Why three skills

Journaling and backlog management are useful independently. Keeping them as
separate skills prevents a simple request to log work from unexpectedly
reprioritizing a project, and prevents TODO maintenance from manufacturing a
session narrative.

The third skill composes both practices when creating or strengthening a
repository. It can also add a concise handoff or documentation taxonomy when a
project is complex enough to benefit, but those structures are optional.

## Public boundary

This repository publishes the generalized method, not the source repositories
or their contents. Examples and fixtures must remain synthetic. Provenance does
not require exposing project names, employers, clients, systems, network
details, costs, credentials, or other private operational context.
