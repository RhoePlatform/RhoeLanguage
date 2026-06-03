# 22 — Computable Blocks and Sandboxing

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 2 / Realization and Runtime

## 1. Purpose
This chapter defines the bounded execution model for computable blocks and runtime helpers.

## 2. Scope
- computable blocks remain bounded runtime features
- they must not redefine canonical ontology
- they must not bypass validation or registry checks

## 3. Sandboxing Principles
- capability-gated execution
- deterministic defaults
- explicit I/O boundaries
- no ambient access to the whole AST unless a specific runtime contract permits it

## 4. Runtime Boundaries
- Phase 1 value transforms do not see the AST.
- Canonical normalization occurs before target emission.
- Runtime helpers may consume bounded payloads and return structured results.

## 5. Carrier Safety
- Computable behavior MUST preserve carrier locality.
- A helper for `ledgerRegister` may not silently inject `stageFrame` nodes.
- Generated output MUST still validate against the same root ontology.
