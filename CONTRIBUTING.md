# Contributing to RhoeLanguage

Thanks for helping improve `RhoeLanguage`.

This repository is the contributor-facing normative authority for the stable
`v0.9.0` Rhoe language family. Changes here should keep prose, machine
artifacts, fixtures, compiled references, and generated release-pack surfaces
in sync whenever the public language contract changes.

## Before You Start

- Read [README.md](README.md) for the public authority model.
- Read [SPECIFICATION-CONVENTIONS.md](SPECIFICATION-CONVENTIONS.md) before
  changing normative language or conformance rules.
- Read [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) before participating.
- Treat `rhoemd`, `rhoedsl`, `rhoejson`, `rhoelatex`, `rhoetypst`, and
  `rhoehtml` as the public language-family surfaces maintained here.

## Repository Layout

- `part-0-foundation/`, `part-1-author-surfaces/`, `part-2-realization-runtime/`
  Normative spec prose
- `machine/`
  Schemas, grammars, registries, and machine examples
- `fixtures/`
  Canonical fixture corpus and suite manifest
- `reference-packs/`
  Shipped realization-pack manifests
- `compiled/`
  Generated release-pack summary
- `scripts/`
  Release-pack generator, documentation-site builder, and maintainer
  verification entrypoints

## Typical Workflow

1. Update the relevant normative prose, machine artifacts, fixtures, or docs.
2. Regenerate the release pack if your change affects public authority output.
3. Run the authoritative maintainer gate.
4. Update README or contributor-facing docs when the public contract changes.
5. Open a focused pull request with a short summary and verification notes.

## Validation

Run the canonical repo-local gate from the repo root:

```sh
bash ./scripts/verify-cutover.sh
```

That gate regenerates the release pack, reruns the preserved `v0.9.0` validator,
runs publication-readiness checks, validates the documentation-site source, and
checks repository diff cleanliness.

To validate only the documentation site source:

```sh
bash ./scripts/validate-docs-site.sh
```

## Pull Request Expectations

A strong pull request includes:

- a clear summary of the normative or tooling change
- the language-family surfaces affected
- updated generated or machine-readable artifacts when required
- updated docs when the public authority contract changes
- verification notes with the commands you ran
