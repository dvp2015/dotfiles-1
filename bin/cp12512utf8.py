#!/usr/bin/env python

"""Convert text encoding from cp1251 to unicode."""

from __future__ import annotations

import sys

from pathlib import Path

def main():
    inp = Path(sys.argv[1])
    out = inp.with_suffix(".utf8")
    out.write_text(inp.read_text(encoding="cp1251"), encoding="utf8")

if __name__ == "__main__":
    main()
