#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
PYTHON_BIN="${PYTHON_BIN:-python3}"

cd "${REPO_ROOT}"

echo "==> ${PYTHON_BIN} ./scripts/build-release-pack.py"
"${PYTHON_BIN}" ./scripts/build-release-pack.py

echo
echo "==> bash ./scripts/validate-spec-v0_9.sh"
bash ./scripts/validate-spec-v0_9.sh

echo
echo "==> bash ./scripts/validate-publication-readiness.sh"
bash ./scripts/validate-publication-readiness.sh

echo
echo "==> bash ./scripts/validate-docs-site.sh"
bash ./scripts/validate-docs-site.sh

echo
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "==> git diff --check"
  git diff --check

  echo
  echo "==> git diff --exit-code"
  git diff --exit-code
else
  echo "==> git diff checks skipped (non-git public staging directory)"
fi

echo
echo "RhoeLanguage cutover verification passed."
