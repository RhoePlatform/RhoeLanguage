# Security Policy

`RhoeLanguage` accepts responsible disclosure for vulnerabilities or unsafe
language-authority guidance affecting parsing, validation, sandboxing,
computable blocks, target realization, or downstream implementation contracts.

## Supported Versions

The first supported public language-authority line is `v0.9.x` after the
initial public release is tagged.

## Reporting

Before GitHub private vulnerability reporting is enabled on the public repo,
contact the RhoePlatform maintainers privately through the organization security
channel. Do not open public issues for suspected vulnerabilities.

Please include:

- A clear description of the issue.
- Minimal reproduction material, fixture input, schema sample, or affected
  normative section.
- Affected language surface, target profile, package, or downstream runtime.
- Any known impact on confidentiality, integrity, availability, sandbox
  boundaries, or generated artifacts.

## Maintainer Response

Maintainers will acknowledge valid reports, triage severity, prepare a fix or
spec clarification on a private branch if needed, and publish coordinated
release notes once remediation is available.

## License

Security fixes, advisories, and normative clarifications for this repository are
governed by the Apache 2.0 license in `LICENSE`.
