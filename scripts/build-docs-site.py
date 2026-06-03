#!/usr/bin/env python3

from __future__ import annotations

import argparse
import re
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DOCS_SRC = ROOT / ".docs-site-src"

COPY_PATHS = [
    "00-index.md",
    "SPECIFICATION-CONVENTIONS.md",
    "VERSIONING.md",
    "GLOSSARY.md",
    "REFERENCES.md",
    "CONTRIBUTING.md",
    "GOVERNANCE.md",
    "SECURITY.md",
    "CODE_OF_CONDUCT.md",
    "part-0-foundation",
    "part-1-author-surfaces",
    "part-2-realization-runtime",
    "machine",
    "fixtures",
    "reference-packs",
    "compiled",
]

GITHUB_BLOB_ROOT = "https://github.com/RhoePlatform/RhoeLanguage/blob/main"

IGNORE_NAMES = {
    ".DS_Store",
    ".git",
    ".github",
    ".tmp",
    ".cache",
    ".docs-site-src",
    "site",
    "node_modules",
    "__pycache__",
}


def ignore_entries(_directory: str, names: list[str]) -> set[str]:
    return {name for name in names if name in IGNORE_NAMES or name.endswith(".pyc")}


def copy_path(relative_path: str) -> None:
    source = ROOT / relative_path
    destination = DOCS_SRC / relative_path
    if not source.exists():
        raise SystemExit(f"Missing docs source path: {relative_path}")
    if source.is_dir():
        shutil.copytree(source, destination, ignore=ignore_entries)
    else:
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source, destination)


def rewrite_markdown_links() -> None:
    replacements = {
        "(README.md)": "(index.md)",
        "(../README.md)": "(../index.md)",
        "(mkdocs.yml)": f"({GITHUB_BLOB_ROOT}/mkdocs.yml)",
        "(LICENSE)": f"({GITHUB_BLOB_ROOT}/LICENSE)",
        "(../LICENSE)": f"({GITHUB_BLOB_ROOT}/LICENSE)",
        "(NOTICE)": f"({GITHUB_BLOB_ROOT}/NOTICE)",
        "(../NOTICE)": f"({GITHUB_BLOB_ROOT}/NOTICE)",
    }
    script_link_pattern = re.compile(r"\((\.\./)?scripts/([^)#]+)(#[^)]+)?\)")

    for path in DOCS_SRC.rglob("*.md"):
        text = path.read_text(encoding="utf-8")
        for old, new in replacements.items():
            text = text.replace(old, new)
        text = script_link_pattern.sub(
            lambda match: f"({GITHUB_BLOB_ROOT}/scripts/{match.group(2)})",
            text,
        )
        path.write_text(text, encoding="utf-8")


def build() -> None:
    if DOCS_SRC.exists():
        shutil.rmtree(DOCS_SRC)
    DOCS_SRC.mkdir(parents=True)

    for path in COPY_PATHS:
        copy_path(path)

    readme = ROOT / "README.md"
    index = DOCS_SRC / "index.md"
    index.write_text(readme.read_text(encoding="utf-8"), encoding="utf-8")
    rewrite_markdown_links()
    (DOCS_SRC / ".nojekyll").write_text("", encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Build the generated MkDocs source tree for RhoeLanguage."
    )
    parser.add_argument(
        "--print-root",
        action="store_true",
        help="Print the generated docs source directory after building.",
    )
    args = parser.parse_args()

    build()
    if args.print_root:
        print(DOCS_SRC)
    else:
        print(f"Wrote {DOCS_SRC}")


if __name__ == "__main__":
    main()
