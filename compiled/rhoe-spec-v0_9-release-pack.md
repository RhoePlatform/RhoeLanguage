# Rhoe Language v0.9.0 Release Pack

This generated release pack is the explicit contributor-facing publication surface for the stable `v0.9.0` authority baseline hosted in `RhoeLanguage`.

## Release identity

- spec id: `rhoe.language-spec.v0_9`
- label: `Rhoe Language Specification v0.9.0`
- version: `0.9.0`
- status: `stable_authority_baseline`
- authority repo: `RhoeLanguage`

## Contributor-facing authority contract

- language-family surfaces: `rhoemd`, `rhoedsl`, `rhoejson`, `rhoelatex`, `rhoetypst`, `rhoehtml`
- specification conventions: [`../SPECIFICATION-CONVENTIONS.md`](../SPECIFICATION-CONVENTIONS.md)
- contributor docs: [`../README.md`](../README.md), [`../CONTRIBUTING.md`](../CONTRIBUTING.md), [`../CODE_OF_CONDUCT.md`](../CODE_OF_CONDUCT.md), [`../NOTICE`](../NOTICE)
- canonical maintainer gate: [`../scripts/verify-cutover.sh`](../scripts/verify-cutover.sh)

## Authoritative entrypoints

- `normative_index`: [`../00-index.md`](../00-index.md)
- `specification_conventions`: [`../SPECIFICATION-CONVENTIONS.md`](../SPECIFICATION-CONVENTIONS.md)
- `versioning`: [`../VERSIONING.md`](../VERSIONING.md)
- `glossary`: [`../GLOSSARY.md`](../GLOSSARY.md)
- `references`: [`../REFERENCES.md`](../REFERENCES.md)
- `release_pack_summary`: [`../compiled/rhoe-spec-v0_9-release-pack.md`](../compiled/rhoe-spec-v0_9-release-pack.md)
- `validator`: [`../scripts/validate-spec-v0_9.sh`](../scripts/validate-spec-v0_9.sh)
- `cutover_verifier`: [`../scripts/verify-cutover.sh`](../scripts/verify-cutover.sh)
- `fixture_manifest`: [`../fixtures/fixture-suite-v0_9.json`](../fixtures/fixture-suite-v0_9.json)

## Machine artifacts

- schemas: 4
  - [`../machine/schemas/composition-grammar-pack-manifest-v0_9.schema.json`](../machine/schemas/composition-grammar-pack-manifest-v0_9.schema.json)
  - [`../machine/schemas/fixture-suite-manifest-v0_9.schema.json`](../machine/schemas/fixture-suite-manifest-v0_9.schema.json)
  - [`../machine/schemas/realization-pack-manifest-v0_9.schema.json`](../machine/schemas/realization-pack-manifest-v0_9.schema.json)
  - [`../machine/schemas/rhoejson-canonical-v0_9.schema.json`](../machine/schemas/rhoejson-canonical-v0_9.schema.json)
- grammars: 3
  - [`../machine/grammars/rhoedsl-v0_9.ebnf`](../machine/grammars/rhoedsl-v0_9.ebnf)
  - [`../machine/grammars/rhoemd-v0_9.ebnf`](../machine/grammars/rhoemd-v0_9.ebnf)
  - [`../machine/grammars/rhoemd-v0_9.peg`](../machine/grammars/rhoemd-v0_9.peg)
- registries: 10
  - [`../machine/registries/carriers.json`](../machine/registries/carriers.json)
  - [`../machine/registries/compatibility-aliases.json`](../machine/registries/compatibility-aliases.json)
  - [`../machine/registries/composition-grammars.json`](../machine/registries/composition-grammars.json)
  - [`../machine/registries/realization-packs.json`](../machine/registries/realization-packs.json)
  - [`../machine/registries/realization-profiles.json`](../machine/registries/realization-profiles.json)
  - [`../machine/registries/rhoemd-keywords.json`](../machine/registries/rhoemd-keywords.json)
  - [`../machine/registries/stage-genres.json`](../machine/registries/stage-genres.json)
  - [`../machine/registries/stage-shell-roles.json`](../machine/registries/stage-shell-roles.json)
  - [`../machine/registries/stage-zones.json`](../machine/registries/stage-zones.json)
  - [`../machine/registries/target-surfaces.json`](../machine/registries/target-surfaces.json)
- examples: 1
  - [`../machine/examples/stage-default.composition-grammar-pack.json`](../machine/examples/stage-default.composition-grammar-pack.json)

## Reference realization packs

- shipped pack manifests: 3
  - [`../reference-packs/rhoeHtmlCore/manifest.json`](../reference-packs/rhoeHtmlCore/manifest.json)
  - [`../reference-packs/rhoeLatexCore/manifest.json`](../reference-packs/rhoeLatexCore/manifest.json)
  - [`../reference-packs/rhoeTypstCore/manifest.json`](../reference-packs/rhoeTypstCore/manifest.json)

## Compiled outputs

- [`../compiled/rhoe-spec-v0_9-release-pack.md`](../compiled/rhoe-spec-v0_9-release-pack.md)

## Reproducible maintainer flow

- regenerate the release pack: `python3 ./scripts/build-release-pack.py`
- run the authoritative repo gate: `bash ./scripts/verify-cutover.sh`
