---
name: implement
description: Implement tickets or specs with validation, review, and completion evidence.
disable-model-invocation: false
---

## Establish context

Read the ticket or spec, linked sources, validation decisions, and relevant prerequisite findings. Verify consequential claims against code. For a ticket set, work in dependency order; start only unblocked tickets. Record blockers and continue independent authorized work.

Before each ticket or direct spec, capture the starting revision and pre-existing staged/worktree changes. Distinguish its review scope from earlier tickets and unrelated changes.

## Implement and validate

Use TDD where useful at agreed behavioral seams; otherwise select existing seams appropriate to the change. Run focused checks during implementation and required repository checks before completion. Reuse passing evidence until relevant changes invalidate it. Unexecuted checks are not passing evidence.

Follow repository comment/documentation conventions and applicable `doc-style.md`, including function/API formats and tags. Preserve API contracts; limit incidental comments to non-obvious intent or invariants and describe current behavior.

For documentation work, validate examples, links, rendering, and applicable documentation checks.

## Review and resolve

Use [code-review-specs](../code-review-specs/SKILL.md), supplying the ticket/spec, starting revision, actual changes including uncommitted work, and validation evidence. Resolve blocking findings, rerun affected checks, and review corrections. The review stays read-only; implementation owns fixes.

## Record completion

Record concise evidence in the ticket's completion section, creating it when needed: outcome, material decisions, reviewed changes, check results, findings/resolutions, and remaining limitations.

Mark Done only when acceptance criteria and required checks pass and blocking findings are resolved. Check satisfied criteria, set `**Status:** Done` below the title, and check the corresponding index entry when present. Never weaken criteria to claim completion. For a direct spec, report evidence and completion without requiring ticket files.

After a ticket set, verify the integrated result and run any outstanding integration checks.
