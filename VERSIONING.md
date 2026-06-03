# Versioning

## Status

- Normative guidance
- Version: `0.9.0`
- Layer: Public release and compatibility policy

## Public Version

The first public Rhoe Language authority line is `0.9.0`.

The `0.9.0` label means the specification is mature enough for public
implementation work, fixture development, and engine conformance testing, while
still allowing pre-`1.0` adjustments before the language is declared fully
stable.

## Tags and File Stems

- Public release tags use SemVer syntax: `v0.9.0`, `v0.9.1`, and so on.
- Human-facing prose uses `0.9.0`.
- Filesystem-safe version stems use `v0_9`.
- Schema IDs, fixture suite IDs, release-pack IDs, and grammar filenames use
  the `v0_9` stem for this release line.

## Compatibility Policy Before 1.0

Before `1.0.0`, a minor version bump MAY include breaking language changes when
the change is clearly documented and justified.

Patch releases in the `0.9.x` line SHOULD be limited to:

- editorial clarifications that do not change conformance behavior
- schema or registry corrections that align machine artifacts with existing
  normative prose
- fixture corrections that remove ambiguity without expanding required behavior
- security or safety clarifications
- documentation-site or publication-tooling fixes

## Path to 1.0

The `1.0.0` release should be reserved for the first public line where:

- normative prose, schemas, grammars, registries, fixtures, and reference packs
  are mutually consistent
- first-wave public engines can cite the same conformance contract
- compatibility-only forms are explicitly bounded
- versioning, release, and documentation publication workflows are reproducible

## Deprecation Policy

Compatibility-only forms MAY remain accepted across the `0.9.x` line, but
canonical writers SHOULD NOT emit them unless strict preservation mode is
explicitly requested.

Removal of a compatibility-only form requires a minor or major version bump and
a documented migration path.
