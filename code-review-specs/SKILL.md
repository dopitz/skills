---
name: code-review-specs
description: Review an implementation for code quality and compliance with its ticket or spec, reporting evidence and completion blockers separately.
---

Stay read-only. Implementation and fixes belong to [implement](../implement/SKILL.md).

## Establish scope

Use the supplied ticket/spec, source references, starting revision, implementation changes, and validation evidence. Follow explicit local paths or tracker URLs before searching nearby documents. Do not assume a particular directory layout or that implementation checks passed.

Include relevant staged/worktree changes and distinguish unrelated pre-existing edits. If the comparison base is materially ambiguous, clarify it rather than inventing a boundary.

For a ticket, review its acceptance criteria and applicable parent-spec constraints. Requirements assigned to later tickets are outside this review. Without a parent spec, review the ticket and disclose the missing context. Without either, perform code review and report requirements review unavailable.

## Review

Use [code-review](../code-review/SKILL.md) for code quality and its finding format, severities, and blocking/advisory decisions. Do not duplicate its methodology or findings.

Compare each in-scope requirement with implementation and validation evidence:

- **PASS:** Evidence supports satisfaction.
- **PARTIAL:** Only partly satisfied.
- **FAIL:** Evidence shows noncompliance.
- **UNVERIFIED:** Evidence is insufficient; name the missing check or context.
- **N/A:** Does not apply; explain why.

A test's existence alone is not proof. Distinguish code inspection from executed validation. Required criteria that are PARTIAL, FAIL, or UNVERIFIED block completion.

## Report

Keep the result concise:

1. **Context:** Starting revision, reviewed changes (including uncommitted work), ticket/spec references, and validation limits.
2. **Code review:** Findings from code-review.
3. **Spec review:** Requirement/status/evidence table. For unmet or unverified criteria, identify the correction or missing evidence; reference related code findings instead of repeating them.
4. **Gate:** PASS only when required criteria/checks are satisfied and no blocking findings remain; otherwise NOT PASSED, naming blockers or unavailable evidence. List advisory findings separately from blockers.
