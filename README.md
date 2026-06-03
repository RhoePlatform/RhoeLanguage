# RhoeLanguage

`RhoeLanguage` is the contributor-facing Apache 2.0 normative authority repo
for the Rhoe language family.

It hosts the stable `v0.9.0` baseline for:

- normative prose across Part 0, Part 1, and Part 2
- RFC-style specification conventions and conformance classes
- machine schemas, grammars, registries, and examples
- canonical fixtures and validation manifests
- reference realization packs
- generated release-pack entrypoints

## Repository layout

- [`00-index.md`](00-index.md): normative root index for the `v0.9.0` baseline
- [`SPECIFICATION-CONVENTIONS.md`](SPECIFICATION-CONVENTIONS.md): normative language, BCP 14 keywords, conformance classes, and stable anchor policy
- [`VERSIONING.md`](VERSIONING.md): public SemVer policy for the language authority line
- [`GLOSSARY.md`](GLOSSARY.md): reader-facing glossary of core language terms
- [`REFERENCES.md`](REFERENCES.md): normative and informative references
- [`part-0-foundation/`](part-0-foundation/): ontology, serialization, normalization, and registries
- [`part-1-author-surfaces/`](part-1-author-surfaces/): `rhoemd` and `rhoedsl` author-surface doctrine
- [`part-2-realization-runtime/`](part-2-realization-runtime/): realization, runtime, conformance, and migration
- [`machine/`](machine/): schemas, grammars, registries, and machine examples
- [`fixtures/`](fixtures/): canonical and invalid fixture corpus
- [`reference-packs/`](reference-packs/): shipped baseline realization packs
- [`compiled/`](compiled/): generated public release-pack summary

## Authority model

- The active normative authority for `v0.9.0` now lives in this repo.
- Normative terms use the BCP 14 keyword policy in [`SPECIFICATION-CONVENTIONS.md`](SPECIFICATION-CONVENTIONS.md).
- The contributor-facing language-family authority surface covers `rhoemd`,
  `rhoedsl`, `rhoejson`, `rhoelatex`, `rhoetypst`, and `rhoehtml`.
- Downstream parser, runtime, publishing, and target repos should treat this
  repo as the source of truth for language-level spec questions.

## Contributor-facing repo contract

- Apache 2.0 license: [`LICENSE`](LICENSE)
- notice surface: [`NOTICE`](NOTICE)
- contribution guide: [`CONTRIBUTING.md`](CONTRIBUTING.md)
- governance model: [`GOVERNANCE.md`](GOVERNANCE.md)
- security policy: [`SECURITY.md`](SECURITY.md)
- community conduct: [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md)
- canonical maintainer gate: [`scripts/verify-cutover.sh`](scripts/verify-cutover.sh)
- explicit generated release-pack surface:
  [`compiled/rhoe-spec-v0_9-release-pack.md`](compiled/rhoe-spec-v0_9-release-pack.md)
- documentation-site source: [`mkdocs.yml`](mkdocs.yml) plus [`scripts/build-docs-site.py`](scripts/build-docs-site.py)

## Maintainer gate

Run the authoritative repo-local gate:

```bash
bash ./scripts/verify-cutover.sh
```

That wrapper regenerates the release pack, runs the preserved `v0.9.0` spec
validator from the repo root, and then checks repository diff cleanliness.

## Documentation site

The GitHub Pages site is generated from the same Markdown authority files rather
than a separate documentation copy.

```bash
bash ./scripts/validate-docs-site.sh
```

The validation script builds a temporary MkDocs source tree in `.docs-site-src/`
and renders it with MkDocs when the MkDocs tooling is installed.

## Release pack

The release pack is the explicit contributor-facing publication surface for the
stable `v0.9.0` baseline:

- machine manifest: [`machine/registries/rhoe-language-spec-release.json`](machine/registries/rhoe-language-spec-release.json)
- human release summary: [`compiled/rhoe-spec-v0_9-release-pack.md`](compiled/rhoe-spec-v0_9-release-pack.md)
- generator: [`scripts/build-release-pack.py`](scripts/build-release-pack.py)

Regenerate those surfaces directly with:

```bash
python3 ./scripts/build-release-pack.py
```
