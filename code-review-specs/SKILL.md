---

name: code-review-specs
description: Review a completed implementation against both the repository's general code-review standards and the originating spec/ticket. Run the general code review and a focused spec review, then report both separately.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Code Review Specs

Review the completed implementation on two independent axes:

1. **Code review** — invoke `/code-review` for the repository's general code-quality review.
2. **Spec review** — verify that the implementation satisfies the originating ticket and spec.

The implementation has already been completed and tested by `/implement`. **Do not modify code.**

## 1. Establish context

Use the work supplied by `/implement` to identify:

* The fixed point before implementation began.
* The implementation commit/branch.
* The ticket, if one exists.
* The originating spec.

If the user supplied a ticket or spec path, use it directly.

For a ticket, look for its parent spec in the surrounding feature directory:

```text
.scratch/<feature>/
├── spec.md
└── issues/
    ├── 00-index.md
    └── 01-ticket.md
```

If no ticket exists, review directly against the spec.

If no spec can be found, report that the spec review could not be performed rather than inventing requirements.

## 2. Run the code review

Invoke `/code-review` against the implementation.

Do not duplicate its review methodology or findings. Use its output as the **Code Review** section of the final result.

## 3. Review against the spec

Read the originating spec and ticket, then compare the implementation against their explicit requirements and acceptance criteria.

Focus only on **spec compliance**, not general code quality.

For each requirement, determine:

* **PASS** — satisfied by the implementation.
* **PARTIAL** — only partly satisfied.
* **FAIL** — not satisfied.
* **N/A** — does not apply.

Check the implementation and relevant tests as evidence. Do not assume a requirement is satisfied merely because a related test exists.

Pay particular attention to explicit edge cases, error behavior, constraints, and acceptance criteria.

## 4. Final report

Keep the two reviews separate:

```markdown
# Code Review

<output/findings from /code-review>

# Spec Review

## Summary

<brief assessment of spec compliance>

## Requirements

| Requirement | Status | Evidence |
|---|---|---|
| ... | PASS | ... |
| ... | PARTIAL | ... |
| ... | FAIL | ... |

## Findings

<Only PARTIAL/FAIL requirements, with concise explanations>

## Context

- **Fixed point:** `<commit/ref>`
- **Implementation:** `<commit/ref>`
- **Ticket:** `<path or none>`
- **Spec:** `<path or none>`
```

If there are no spec issues, say so explicitly.

End with a brief overall conclusion stating whether:

* the implementation has meaningful code-review issues; and
* the implementation satisfies the originating spec.

Do not modify code or fix findings.
