# Grammar Artifacts — v0.9.0 Baseline

This directory contains the formal grammar artifacts for the `0.9.0` source surfaces.

## Status
- `rhoemd-v0_9.peg` — primary parser-oriented grammar artifact
- `rhoemd-v0_9.ebnf` — informative structural mirror of the canonical `rhoemd` surface
- `rhoedsl-v0_9.ebnf` — informative structural grammar summary for the `rhoedsl` surface
- prose homes — Part 1 Chapters 15 through 17

## Policy
- Normative meaning lives in the prose chapters.
- The PEG file is the authoritative machine grammar for parser-oriented dispatch and token-family recognition.
- The EBNF files are review-oriented mirrors. They summarize the same baseline, but they are not the sole authority for parser behavior.
- Exact fence equality and nested fence-length enforcement are normative parser and conformance obligations. They are represented in the prose and in fixtures even where the formal grammars only model directive-fence families.

## Synchronization Rule
Whenever any of the following change, the grammar files and the prose chapters MUST be updated in the same editing pass:
- directive families
- keyword registries
- canonical versus deprecated surface spellings
- carrier-specific directives
- compatibility lowering
- fence or tokenization doctrine

Do not let prose, grammar, registries, and fixtures drift apart.
