---
name: implement-ticket
description: "Implement tickets with validation, review and completion evidence."
disable-model-invocation: false
---

## Establish context

Implement the ticket using its linked specifications and relevant prerequisite review findings. Verify consequential claims against code. If blocked, record the specific blocker and required resolution; leave the ticket incomplete.

## Complete and validate

Use TDD where possible at pre-agreed seams. Run build/type checks and focused tests during implementation, then the required full suite before completion. Unexecuted checks are not passing evidence.

Comment only crucial decisions not obvious from the code; describe current behavior, not historical changes.

For review gates, produce evidence and a pass/fail decision. Blocking findings keep the gate incomplete.

For documentation tickets, follow applicable `doc-style.md` or equivalent, if present; validate documentation, examples, links and rendering instead of applying code TDD.

## Review and resolve findings

Review implementation with `/code-review-specs`, explicitly supplying the ticket, linked specifications and changes. Record results in the ticket's review section. Resolve blocking findings, rerun affected checks and review corrections before marking Done.

## Record evidence and completion

Keep concise completion evidence in the ticket: outcome, material decisions, reviewed revision/changes, validation commands/results, findings and resolutions, and remaining limitations relevant to downstream work.

When acceptance criteria are satisfied and blocking findings resolved, check satisfied criteria, add `**Status:** Done` below the title, and mark the index entry done. Never weaken criteria to claim completion.
