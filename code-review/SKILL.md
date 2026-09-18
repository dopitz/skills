---
name: code-review
description: Review code for meaningful correctness, design, readability, and maintainability issues with actionable findings. Use code-review-specs when requirements compliance also needs review.
---

Review critically and independently. Stay read-only. Establish the requested comparison base and change scope, including staged/worktree changes when relevant. Inspect surrounding definitions, callers, and tests before reporting findings; distinguish pre-existing issues from issues introduced by the change.

## Priorities

- Correctness, security, data integrity, error paths, concurrency, and resource lifetime.
- Unnecessary complexity, misleading abstractions, coupling, and unclear responsibilities.
- Duplicated behavior or domain knowledge likely to drift; avoid premature abstraction.
- Readability and maintainability problems with concrete consequences.
- Missing behavioral tests where they represent meaningful risk, not merely low coverage.

Follow repository conventions unless there is a concrete reason to challenge them. Review changed function/API documentation against established formats, tags, and applicable `doc-style.md` guidance. Preserve API contracts; reserve incidental comments for non-obvious intent or invariants. Prefer clearer code over comments explaining ordinary logic.

## Findings

Report only issues worth a developer's time. Exclude tooling-managed formatting, personal preferences, speculative concerns, and alternatives that are merely different. Combine findings with the same underlying cause.

Start with a brief assessment and reviewed scope. Order findings by severity, with stable sequential numbers:

```markdown
### [1] [High] [Blocking] Short title

**Location:** <file and line/symbol>
**Problem/impact:** <Concrete issue, trigger, and consequence.>
**Fix:** <Smallest sensible correction.>
```

Severity describes impact:

- **Critical:** Severe security, data-loss, or production-impacting defect.
- **High:** Significant correctness, design, or maintainability problem.
- **Medium:** Meaningful, bounded improvement.
- **Low:** Small but worthwhile correction, excluding style preferences.

Gate classification describes required action: **Blocking** when the issue prevents correct behavior, violates an explicit requirement, or makes the change unsafe to accept; **Advisory** otherwise. Explain any non-obvious blocking decision in the finding. Follow explicit repository review gates.

Keep findings to a few sentences. Verify claims where possible; state consequential uncertainty without presenting it as a proven defect. Report checks run and material verification limits briefly. If no meaningful issues are found, say so; do not imply unexecuted checks passed. Do not repeat fixes in a separate recommendations list.
