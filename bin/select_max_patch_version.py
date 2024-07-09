#!python

# dvp 2024

from __future__ import annotations

import sys

from collections import defaultdict

usage = r"""Group list of versions by major.minor and select max version by patch.

Usage:

    pyenv install -s --list | rg -e "^\s+3\.(9|1\d+)\.\d+$" | python select_max_patch_version.py

"""

version = "1.0.0"


def main() -> None:
    if len(sys.argv) > 1:
        if sys.argv[1] in ("-h", "--help"):
            print(usage)
        if sys.argv[1] in ("-v", "--version"):
            print(version)
        sys.exit(0)

    input_versions: list[tuple[int, ...]] = [
        (tuple(int(y) for y in x.split("."))) for x in sys.stdin.readlines()
    ]

    selected_versions: dict[tuple[int, int], int] = defaultdict(int)

    for iv in input_versions:
        major, minor, patch = iv
        key = major, minor
        selected_versions[key] = max(selected_versions[key], patch)

    for key in sorted(selected_versions.keys()):
        major, minor = key
        patch = selected_versions[key]
        print(f"{major}.{minor}.{patch}")


if __name__ == "__main__":
    main()
