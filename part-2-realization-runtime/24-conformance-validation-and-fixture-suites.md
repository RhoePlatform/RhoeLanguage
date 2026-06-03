# 24 — Conformance, Validation, and Fixture Suites

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 2 / Realization and Runtime

## 1. Purpose
This chapter defines conformance expectations for parsers, normalizers, writers, reference packs, and pack-aware tooling.

## 2. Fixture Manifest
- The shipped fixture suite manifest lives at:
  - [`../fixtures/fixture-suite-v0_9.json`](../fixtures/fixture-suite-v0_9.json)
- The fixture manifest validates against:
  - [`../machine/schemas/fixture-suite-manifest-v0_9.schema.json`](../machine/schemas/fixture-suite-manifest-v0_9.schema.json)

## 3. Required Fixture Families
- canonical `RhoeJSON` fixtures
- canonical `rhoemd` fixtures
- canonical `rhoedsl` fixtures
- canonical `RhoeTypst` fixtures
- canonical `RhoeLaTeX` fixtures
- canonical `RhoeHTML` fixtures
- compatibility-lowering fixtures
- carrier-node placement fixtures
- projection conformance fixtures

## 4. Baseline Assertions
1. canonical root is `Artifact`
2. matter zones always exist
3. carrier-specific nodes are placed legally
4. canonical and compatibility humane sources converge to the same AST where specified
5. target-source contracts preserve matter, identity, numbering, references, and projection visibility
6. writers emit canonical humane forms by default

## 5. Carrier Coverage
- The shipped conformance suite includes at least one valid `RhoeJSON` fixture for each baseline carrier.
- The shipped conformance suite includes at least one target-source fixture per carrier for:
  - `RhoeTypst`
  - `RhoeLaTeX`
  - `RhoeHTML`
- The shipped conformance suite includes deep `stageFrame` fixtures covering shell roles and typed zones.

## 6. Validation Severity Contract
- `error`
- `warning`
- `suggestion`

## 7. Humane Surface Compatibility Tests
- `:::slide` and `:::frame` must normalize to equivalent canonical AST where no strict-preservation metadata is retained.
- `%%%`, `%%`, and `%` lowering must preserve stage-zone semantics through compatibility hints.
- unhyphenated matter directives must normalize to hyphenated canonical names.
- exact fence equality and nested fence-length obligations must be asserted through parser checks and shipped negative fixtures.

## 8. Secondary Near-AST Surface Tests
- `RhoeTypst` fixtures MUST preserve:
  - artifact root metadata
  - matter boundaries
  - carrier-native constructors
  - numbering and references
- `RhoeLaTeX` fixtures MUST preserve:
  - artifact root metadata
  - matter boundaries
  - carrier-native environments and commands
  - numbering and references
- `RhoeHTML` fixtures MUST preserve:
  - semantic DOM structure
  - required `rhoe-*` classes
  - required `data-rhoe-*` metadata
  - numbering anchors and projection visibility

## 9. Reference-Pack Smoke Tests
- Baseline-owned `RhoeTypst` starter assets MUST compile in:
  - document template mode
  - presentation template mode
  - inline-definition embedding mode
- Baseline-owned `RhoeLaTeX` starter assets MUST compile in:
  - document template mode
  - presentation template mode
  - inline-preamble embedding mode
- Baseline-owned `RhoeHTML` starter assets MUST pass:
  - static structural validation
  - asset-reference validation
  - JS syntax validation
  - no-custom-element checks
  - required metadata checks

## 10. Reproducible Baseline Validation Harness
- The baseline-owned validation entrypoint lives at:
  - [`../scripts/validate-spec-v0_9.sh`](../scripts/validate-spec-v0_9.sh)
- Canonical Typst fixture validation MUST invoke `typst compile` with `--root` set to the `spec-v0_9` directory.
- Canonical LaTeX fixture validation MUST invoke `latexmk` from the fixture directory, or with an explicitly equivalent package-resolution configuration, so relative reference-pack imports resolve.
- Reference-pack starter smoke checks and canonical fixture compiles are distinct conformance lanes and MAY use different invocation context where the source shapes differ.
- Validation outputs MUST NOT be written inside the normative `spec-v0_9` publication tree.
- The default support location for reproducible local validation output is a non-normative temp root outside the baseline tree.

## 11. HTML-Specific Assertions
- data tables remain semantic tables
- layout grids do not masquerade as data tables
- document profile remains readable without JS
- viewer profile supports keyboard navigation and presenter affordances
- viewer profile exposes active-frame state without erasing semantic frame identity
