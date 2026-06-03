# Rhoe Language Specification v0.9.0

## Status
- Normative baseline: This repo root is the authoritative live baseline for Rhoe Language version `0.9.0`.
- Authority order:
  1. Specification conventions, versioning policy, and normative prose in this repo
  2. Machine artifacts, registries, fixtures, reference packs, and compiled references in this repo when they conform to the prose
- Normative decision: The canonical root is `Artifact`; the canonical version string for this baseline is `0.9.0`.

## Purpose
- This repo is the self-contained, machine-accompanied public baseline for Rhoe Language `0.9.0`.
- It uses a `Part 0 / Part 1 / Part 2` organization with a clear authority gradient:
  - Part 0 defines ontology, canonical serialization, normalization, and registries.
  - Part 1 defines humane source surfaces.
  - Part 2 defines realization, runtime, conformance, and migration.
- `rhoemd` remains the primary humane author surface.
- `rhoedsl` remains the closest humane structural mirror of the canonical AST.
- `RhoeJSON` remains the canonical serialized notation of the canonical AST.
- `RhoeTypst`, `RhoeLaTeX`, and `RhoeHTML` are official Part 2 near-AST target-source surfaces.

## Reading Order

### Public Specification Front Matter
- [`SPECIFICATION-CONVENTIONS.md`](SPECIFICATION-CONVENTIONS.md)
- [`VERSIONING.md`](VERSIONING.md)
- [`GLOSSARY.md`](GLOSSARY.md)
- [`REFERENCES.md`](REFERENCES.md)

### Part 0 — Foundation
- [`part-0-foundation/00-part-0-index.md`](part-0-foundation/00-part-0-index.md)
- [`part-0-foundation/01-language-identity-and-versioning.md`](part-0-foundation/01-language-identity-and-versioning.md)
- [`part-0-foundation/02-abstract-ontology-and-root-artifact.md`](part-0-foundation/02-abstract-ontology-and-root-artifact.md)
- [`part-0-foundation/03-canonical-serialization-and-validation.md`](part-0-foundation/03-canonical-serialization-and-validation.md)
- [`part-0-foundation/04-terminology-taxonomy-and-authority-model.md`](part-0-foundation/04-terminology-taxonomy-and-authority-model.md)
- [`part-0-foundation/05-processing-pipeline-and-normalization.md`](part-0-foundation/05-processing-pipeline-and-normalization.md)
- [`part-0-foundation/06-semantic-attributes-brand-and-critic-doctrine.md`](part-0-foundation/06-semantic-attributes-brand-and-critic-doctrine.md)
- [`part-0-foundation/07-stable-identity-numbering-and-cross-references.md`](part-0-foundation/07-stable-identity-numbering-and-cross-references.md)
- [`part-0-foundation/08-source-surfaces-notation-islands-and-surface-equivalence.md`](part-0-foundation/08-source-surfaces-notation-islands-and-surface-equivalence.md)
- [`part-0-foundation/09-core-registries.md`](part-0-foundation/09-core-registries.md)
- [`part-0-foundation/10-artifact-workbench-contract-authority.md`](part-0-foundation/10-artifact-workbench-contract-authority.md)

### Part 1 — Author Surfaces
- [`part-1-author-surfaces/00-part-1-index.md`](part-1-author-surfaces/00-part-1-index.md)
- [`part-1-author-surfaces/10-rhoemd-overview-and-authoring-doctrine.md`](part-1-author-surfaces/10-rhoemd-overview-and-authoring-doctrine.md)
- [`part-1-author-surfaces/11-rhoemd-core-block-and-inline-syntax.md`](part-1-author-surfaces/11-rhoemd-core-block-and-inline-syntax.md)
- [`part-1-author-surfaces/12-rhoemd-matter-carriers-and-structural-directives.md`](part-1-author-surfaces/12-rhoemd-matter-carriers-and-structural-directives.md)
- [`part-1-author-surfaces/13-rhoemd-stageframe-surface-and-compatibility.md`](part-1-author-surfaces/13-rhoemd-stageframe-surface-and-compatibility.md)
- [`part-1-author-surfaces/14-rhoemd-nonstage-carrier-surfaces.md`](part-1-author-surfaces/14-rhoemd-nonstage-carrier-surfaces.md)
- [`part-1-author-surfaces/15-rhoemd-formal-grammar-and-tokenization.md`](part-1-author-surfaces/15-rhoemd-formal-grammar-and-tokenization.md)
- [`part-1-author-surfaces/16-rhoedsl-reference.md`](part-1-author-surfaces/16-rhoedsl-reference.md)
- [`part-1-author-surfaces/17-surface-equivalence-roundtripping-and-lowering.md`](part-1-author-surfaces/17-surface-equivalence-roundtripping-and-lowering.md)

### Part 2 — Realization and Runtime
- [`part-2-realization-runtime/00-part-2-index.md`](part-2-realization-runtime/00-part-2-index.md)
- [`part-2-realization-runtime/20-target-realization-and-emission-doctrine.md`](part-2-realization-runtime/20-target-realization-and-emission-doctrine.md)
- [`part-2-realization-runtime/20a-secondary-near-ast-surface-doctrine.md`](part-2-realization-runtime/20a-secondary-near-ast-surface-doctrine.md)
- [`part-2-realization-runtime/20b-rhoetypst-near-ast-contract.md`](part-2-realization-runtime/20b-rhoetypst-near-ast-contract.md)
- [`part-2-realization-runtime/20c-rhoelatex-near-ast-contract.md`](part-2-realization-runtime/20c-rhoelatex-near-ast-contract.md)
- [`part-2-realization-runtime/20d-rhoehtml-near-ast-contract.md`](part-2-realization-runtime/20d-rhoehtml-near-ast-contract.md)
- [`part-2-realization-runtime/20e-target-profiles-and-realization-pack-contracts.md`](part-2-realization-runtime/20e-target-profiles-and-realization-pack-contracts.md)
- [`part-2-realization-runtime/21-extension-and-composition-grammar-pack-architecture.md`](part-2-realization-runtime/21-extension-and-composition-grammar-pack-architecture.md)
- [`part-2-realization-runtime/22-computable-blocks-and-sandboxing.md`](part-2-realization-runtime/22-computable-blocks-and-sandboxing.md)
- [`part-2-realization-runtime/23-project-orchestration-build-and-pack-discovery.md`](part-2-realization-runtime/23-project-orchestration-build-and-pack-discovery.md)
- [`part-2-realization-runtime/24-conformance-validation-and-fixture-suites.md`](part-2-realization-runtime/24-conformance-validation-and-fixture-suites.md)
- [`part-2-realization-runtime/25-migration-compatibility-and-version-bridges.md`](part-2-realization-runtime/25-migration-compatibility-and-version-bridges.md)

### Machine Artifacts
- [`machine/registries/rhoe-language-spec-release.json`](machine/registries/rhoe-language-spec-release.json)
- [`machine/schemas/rhoejson-canonical-v0_9.schema.json`](machine/schemas/rhoejson-canonical-v0_9.schema.json)
- [`machine/schemas/composition-grammar-pack-manifest-v0_9.schema.json`](machine/schemas/composition-grammar-pack-manifest-v0_9.schema.json)
- [`machine/schemas/realization-pack-manifest-v0_9.schema.json`](machine/schemas/realization-pack-manifest-v0_9.schema.json)
- [`machine/schemas/fixture-suite-manifest-v0_9.schema.json`](machine/schemas/fixture-suite-manifest-v0_9.schema.json)
- [`machine/grammars/rhoemd-v0_9.peg`](machine/grammars/rhoemd-v0_9.peg)
- [`machine/grammars/rhoemd-v0_9.ebnf`](machine/grammars/rhoemd-v0_9.ebnf)
- [`machine/grammars/rhoedsl-v0_9.ebnf`](machine/grammars/rhoedsl-v0_9.ebnf)
- [`machine/grammars/README.md`](machine/grammars/README.md)
- [`machine/registries/`](machine/registries/)
- [`machine/examples/stage-default.composition-grammar-pack.json`](machine/examples/stage-default.composition-grammar-pack.json)

### Reference Packs
- [`reference-packs/00-reference-packs-index.md`](reference-packs/00-reference-packs-index.md)

### Fixtures
- [`fixtures/00-fixtures-index.md`](fixtures/00-fixtures-index.md)
- [`fixtures/fixture-suite-v0_9.json`](fixtures/fixture-suite-v0_9.json)

### Generated Release Summary
- [`compiled/rhoe-spec-v0_9-release-pack.md`](compiled/rhoe-spec-v0_9-release-pack.md)

### Validation Entry Point
- [`scripts/build-release-pack.py`](scripts/build-release-pack.py)
- [`scripts/validate-spec-v0_9.sh`](scripts/validate-spec-v0_9.sh)

## Architectural Summary
- One language, one canonical AST.
- `Artifact` is the universal root.
- `carrierArchetype` is the primary carrier discriminator.
- `MatterEnvelope` with `frontMatter`, `mainMatter`, and `backMatter` is universal.
- `Section`, `Subsection`, and `SubSubsection` are the universal nesting spine.
- `stageFrame` is the first deeply elaborated carrier specialization.
- `Frame` is the canonical stage-frame unit.
- Canonical `rhoemd` is carrier-aware and frame-primary.
- `:::slide`, `:::slide-section`, `%%%`, `%%`, `%`, and `shell-grammar:` remain supported as deprecated compatibility inputs.

## Versioning Note
- The `0.9.0` label marks this baseline as pre-`1.0` public release work.
- `RhoeLanguage` is now the active authority home for the `0.9.0` baseline.

## Validation Authority
- The executable validation authority for this baseline is [`scripts/validate-spec-v0_9.sh`](scripts/validate-spec-v0_9.sh), wrapped by [`scripts/verify-cutover.sh`](scripts/verify-cutover.sh).
- Generated release-pack metadata is rebuilt by [`scripts/build-release-pack.py`](scripts/build-release-pack.py).
