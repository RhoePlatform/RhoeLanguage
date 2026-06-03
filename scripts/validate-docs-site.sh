#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
WORK_ROOT="${RHOE_LANGUAGE_DOCS_VALIDATION_ROOT:-/tmp/rhoe_language_docs_site_validation}"

cd "${REPO_ROOT}"

cleanup() {
  if [[ "${RHOE_LANGUAGE_KEEP_DOCS_SRC:-0}" != "1" ]]; then
    rm -rf "${REPO_ROOT}/.docs-site-src"
  fi
}
trap cleanup EXIT

echo "==> python3 ./scripts/build-docs-site.py"
python3 ./scripts/build-docs-site.py

echo
echo "==> validating MkDocs nav targets"
python3 - <<'PY'
from pathlib import Path
import re

root = Path(".")
docs_root = root / ".docs-site-src"
config = (root / "mkdocs.yml").read_text(encoding="utf-8")
targets = re.findall(r":\s*([A-Za-z0-9_./-]+\.md)\s*$", config, flags=re.MULTILINE)
missing = [target for target in sorted(set(targets)) if not (docs_root / target).exists()]
if missing:
    for target in missing:
        print(f"MISSING_NAV_TARGET {target}")
    raise SystemExit(1)
print(f"NAV_TARGETS {len(set(targets))}")
PY

echo
if python3 -m mkdocs --version >/dev/null 2>&1; then
  echo "==> python3 -m mkdocs build --strict"
  rm -rf "${WORK_ROOT}"
  mkdir -p "${WORK_ROOT}"
  python3 -m mkdocs build --strict --config-file mkdocs.yml --site-dir "${WORK_ROOT}/site"
  test -f "${WORK_ROOT}/site/index.html"
  echo "DOCS_SITE_PASS ${WORK_ROOT}/site"
else
  echo "MKDOCS_NOT_INSTALLED generated-source validation passed; render skipped"
fi
