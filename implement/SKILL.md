---
name: implement
description: "Implement a piece of work based on a spec or set of tickets."
disable-model-invocation: true
---

Implement the work described by the user in the spec or tickets.

Use tdd where possible, at pre-agreed seams.

Follow the repository's existing comment and documentation conventions, including the format and tags used by surrounding function/API documentation. Apply applicable `doc-style.md` or equivalent guidance to code documentation as well as standalone documentation.

Limit incidental inline comments to non-obvious decisions or invariants. This restriction does not apply to API contracts or established function documentation. Describe current behavior, not historical changes.

Run typechecking regularly, single test files regularly, and the full test suite once at the end.

Once a ticket's acceptance criteria are met, use /code-review-specs with the ticket you just worked on to review.

Once done, mark it done before moving on:

- In the ticket file itself, check off each satisfied `- [ ]` acceptance criterion to `- [x]`.
- Add a `**Status:** Done` line under the ticket's title/heading.
- In the set's `00-index.md`, mark that ticket's list entry as done (e.g. strike it through).

