---
name: code-readability
description: formats code to be better readable
---

Review the code for large continuous blocks and split them into logical units using vertical whitespace.
Avoid eager line wrapping: preserve readable lines up to 120 characters; wrap longer lines at punctuation or logical boundaries.

Add brief explanatory comments where useful:
- Prefer a single line; never more than two.
- Explain the purpose of the unit, not what individual lines do.
- Avoid over-commenting or excessive whitespace.
- Do not change code behavior or structure beyond whitespace and comments.

The goal is to make large blocks easy to scan while keeping the code clean and compact.
