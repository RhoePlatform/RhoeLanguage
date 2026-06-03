# Governance

`RhoeLanguage` is a founder-led Apache 2.0 foundation repository for the
RhoePlatform language-family authority surface.

The initial maintainer group is `@RhoePlatform/maintainers`. Maintainers are
responsible for normative language decisions, release-pack integrity, schema and
grammar authority, compatibility policy, security-sensitive disclosure handling,
and contributor experience.

## Decision Model

- Normative language, schema, grammar, fixture, and registry changes require
  maintainer review.
- Compatibility changes should include the relevant compatibility notes, fixture,
  and release-pack updates.
- Downstream implementation requests should cite this repo when they depend on
  language-level authority.
- Publishing, tags, GitHub Pages activation, and visibility changes are release
  actions and must not happen from unreviewed pull requests.

## Release Stewardship

The `v0.9.0` baseline is staged as the first public Rhoe language authority
release candidate. Release authority stays with maintainers until the initial
clean commit, private remote, final hygiene review, and public visibility switch
are complete.
