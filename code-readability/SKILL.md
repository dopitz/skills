---
name: code-readability
description: Improve code readability with logical spacing, purpose comments, and compact line wrapping.
---

Change only whitespace and comments; preserve behavior and code structure.

- Group related statements into logical blocks, each performing one step. Separate blocks with one blank line.
- Every logical block must have a short, single-line comment immediately above it at the same indentation, even when its code is easy to read. Explain its purpose or constraints using known context; reuse or improve existing comments.
- Individual trivial declarations and obvious standalone statements need no separate comments. Add nested comments only for distinct substeps.
- Use 120 characters, including indentation, as the line-width target. Preserve readable lines that fit, and actively rejoin unnecessarily wrapped calls, signatures, expressions, and short literals that fit on one readable line.
- Wrap longer lines at logical boundaries. Preserve breaks required by syntax, comments, or meaningful grouping.

Before finishing, verify that every logical block has its purpose comment and unnecessarily wrapped statements have been rejoined.
