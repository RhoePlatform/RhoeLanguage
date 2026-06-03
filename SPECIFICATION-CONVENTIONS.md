# Specification Conventions

## Status

- Normative guidance
- Version: `0.9.0`
- Layer: Public specification conventions

## Purpose

This document defines how to read normative language in the Rhoe Language
Specification `0.9.0`.

## Normative Language

The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`, `SHOULD`,
`SHOULD NOT`, `RECOMMENDED`, `NOT RECOMMENDED`, `MAY`, and `OPTIONAL` are to be
interpreted as described by BCP 14 when, and only when, they appear in all
capitals.

Lowercase words such as "must", "should", or "may" carry their ordinary English
meaning and do not create independent conformance requirements.

## Normative and Informative Material

Normative material defines requirements for conforming documents, parsers,
writers, emitters, schemas, registries, fixtures, and reference packs.

Informative material explains intent, examples, rationale, or implementation
guidance. Informative material is useful but cannot override normative prose or
machine artifacts.

Unless a file explicitly says otherwise, the following are normative:

- Part 0, Part 1, and Part 2 prose.
- Machine schemas in `machine/schemas/`.
- Machine registries in `machine/registries/`.
- Grammar artifacts in `machine/grammars/`.
- Fixture manifests and canonical fixture files in `fixtures/`.
- Reference-pack manifests and baseline pack entrypoints in `reference-packs/`.

Generated release-pack summaries in `compiled/` are publication artifacts. They
are authoritative only to the extent that they are generated from, and remain
consistent with, the sources listed above.

## Conformance Classes

A conforming implementation MUST identify which conformance class or classes it
claims.

| Class | Required surface |
| --- | --- |
| `document-conformer` | Produces or stores canonical `RhoeJSON` artifacts that validate against the public schema and fixture contract. |
| `rhoemd-parser` | Accepts `rhoemd` source and lowers it to the canonical AST without losing required semantic structure. |
| `rhoedsl-parser` | Accepts `rhoedsl` source and lowers it to the canonical AST without losing required semantic structure. |
| `canonical-writer` | Emits canonical source or JSON forms from a valid AST while respecting canonical naming and omission rules. |
| `target-emitter` | Emits one or more Part 2 target surfaces according to the selected realization profile and reference-pack contract. |
| `fixture-runner` | Executes the shipped fixture suite and reports pass/fail status for the claimed conformance classes. |

An implementation MAY claim multiple classes. A claim for one class does not
imply conformance to any other class.

## Stability Labels

The specification uses the following stability labels:

| Label | Meaning |
| --- | --- |
| `core-stable` | Expected to remain stable through `1.0` unless a contradiction is discovered. |
| `baseline-stable` | Required for `0.9.0`, but still adjustable before `1.0`. |
| `compatibility-only` | Accepted for parsing, migration, or round-trip preservation, but not recommended for new authoring. |
| `superseded` | Documented only to define compatibility behavior; not valid for canonical output. |
| `extension-owned` | Reserved for namespaced extension packs rather than the core language. |

## Stable Anchor Policy

Public links SHOULD target files and headings that are expected to survive the
`0.9.x` line. Headings SHOULD be descriptive, stable, and unique within a file.

Normative changes SHOULD preserve existing file paths and headings when
possible. If a heading or file path must change, the release notes for the next
tag SHOULD call out the change and provide the replacement location.

## Conflict Resolution

If two authority sources appear to disagree, readers and implementers SHOULD use
this order:

1. Explicit requirements in Part 0.
2. Explicit requirements in Part 1 for authoring surfaces.
3. Explicit requirements in Part 2 for realization and runtime surfaces.
4. Machine schemas and registries that are consistent with the prose.
5. Fixtures and reference packs that are consistent with the prose and machine
   artifacts.
6. Generated release-pack metadata.

Contradictions should be reported as specification issues.
