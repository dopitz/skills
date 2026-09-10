---
name: code-review
description: Review code critically for duplication, readability, maintainability, correctness, and general code quality. Identify meaningful problems, challenge questionable design decisions, and suggest concrete fixes.
---

# Code-review

Review the code **critically and independently**.

The goal is to identify problems that are genuinely worth fixing and provide practical ways to fix them.

Do **not** be a yes-man. If a design is unnecessarily complex, an abstraction is misguided, duplication is accumulating, or the code will become difficult to maintain, say so clearly.

At the same time, **do not nitpick**. Don't report harmless stylistic preferences, theoretical concerns, or alternative implementations that don't provide a meaningful improvement.

## Communication style

Be **concise, precise, and technical**.

Do not overexplain. The review is for developers who can understand the code and technical terminology.

* Get to the point quickly.
* Prefer one precise sentence over three explanatory sentences.
* Don't restate the code unnecessarily.
* Don't explain obvious programming concepts.
* Don't provide background information unless it is necessary to understand the finding.
* Don't repeat the same reasoning in multiple findings.
* Keep examples minimal and directly relevant.
* Avoid generic filler such as "This could potentially lead to..."
* State the actual consequence instead.
* Don't turn a finding into an essay.

A good finding should usually be understandable in **a few sentences**.

Prefer:

> `UserService` and `AdminService` duplicate the permission check. Extract it into `canManageUser()` so the authorization rule cannot diverge.

over:

> There is some duplication between these two services. In general, duplication can be problematic because when business rules change, developers need to remember to update all the different places where this logic exists...

## Review priorities

### 1. Duplication

Look for:

* Duplicated logic, including slightly different copies of the same behavior.
* Repeated transformations, validation, mapping, filtering, or error handling.
* Copy-pasted code that should reasonably share an abstraction.
* Repeated constants, configuration, or domain knowledge that should have a single source of truth.
* Multiple implementations of the same concept that can drift apart.

Don't eliminate duplication at any cost. Some duplication is preferable to a premature or overly generic abstraction.

### 2. Readability

Look for:

* Unclear or misleading names.
* Functions doing too many unrelated things.
* Deep nesting.
* Complicated control flow.
* Dense expressions.
* Clever or overly terse code.
* Unnecessary indirection.
* Abstractions that obscure rather than clarify.
* Code whose structure doesn't match its conceptual behavior.
* Important behavior hidden behind poorly named helpers.

Prefer straightforward code over clever code.

A few extra lines are often preferable if they make the intent substantially clearer.

### 3. Comments

Comments should be **very rare**.

Do not recommend comments to explain ordinary code. First consider whether the code itself can communicate the intent through better naming, structure, types, or control flow.

Comments are appropriate primarily for:

* Genuinely non-obvious or "black magic" behavior.
* Subtle invariants that cannot reasonably be expressed in code.
* Surprising behavior or genuine pitfalls in libraries/frameworks we don't control.
* Explaining why an intentionally non-obvious implementation is necessary.

Never use comments to compensate for confusing code.

### 4. Complexity and design

Be particularly critical of unnecessary complexity.

Look for:

* Abstractions introduced without a clear need.
* Too many layers for a simple problem.
* Generic solutions where a concrete solution would be clearer.
* Excessive indirection.
* Unnecessary patterns or framework machinery.
* Over-engineered state management.
* Responsibilities split across too many places.
* Tight coupling disguised behind abstractions.
* APIs that are difficult to use correctly.
* Designs that make simple future changes unnecessarily difficult.

Don't assume more abstraction is better.

When a simpler design would be easier to understand and maintain, recommend simplifying it.

### 5. Correctness and robustness

Look for actual or likely bugs:

* Incorrect edge-case handling.
* Invalid assumptions.
* Incorrect error handling.
* Lost or swallowed errors.
* Race conditions or state inconsistencies where relevant.
* Incorrect lifecycle/resource management.
* Nullability/type issues.
* Unexpected side effects.
* Behavior that can silently become incorrect as the system evolves.

Prioritize correctness issues over stylistic concerns.

### 6. Maintainability

Consider likely future changes.

Ask:

* Where would a developer go to change this behavior?
* Does one conceptual change require modifications in multiple unrelated places?
* Can the code's invariants be understood locally?
* Are responsibilities obvious?
* Is the abstraction likely to remain useful as the code evolves?
* Does the current design encourage future duplication?
* Is the code easy to test and reason about?

Flag designs that are likely to create recurring maintenance problems.

### 7. Tests

Identify missing tests when they represent meaningful risk.

Prioritize:

* Important edge cases.
* Error paths.
* Regression-prone behavior.
* Complex business logic.
* Behavior that is easy to accidentally break.

Don't recommend tests purely for coverage.

## Challenge assumptions

Do not treat the author's implementation as correct by default.

Ask:

* Is this complexity actually necessary?
* Is this abstraction earning its existence?
* Could this be substantially simpler?
* Is this duplication likely to drift?
* Does the code communicate its intent clearly?
* Will the next change be obvious?
* Is this following a real project convention, or is it a local workaround?

Investigate the surrounding code before raising something as a finding.

Don't invent problems merely because you would implement it differently.

## Respect the codebase

Review the code in context.

Use existing project conventions as evidence, but don't blindly accept them. An established pattern can still be worth challenging if it creates a meaningful problem.

Don't impose generic best practices that don't fit the project's architecture or requirements.

Prefer consistency with the codebase unless there is a concrete reason not to.

## Findings

Every finding must have a unique sequential number so it can be referenced later.

Use:

### [1] [High] Short title

**Problem:** Concise description of the issue.

**Why:** Concrete impact.

**Fix:** Specific recommendation.

Use these priorities:

* **Critical** — severe correctness, security, data-loss, or production-impacting issue.
* **High** — significant correctness, design, or maintainability problem.
* **Medium** — meaningful improvement worth addressing.
* **Low** — minor but reasonably worthwhile improvement.

Do not use **Low** for stylistic preferences. If something isn't worth a developer's time, don't report it.

Combine findings that have the same underlying cause.

If a finding depends on an assumption about unseen code, state the assumption briefly.

## Actionable fixes

Every finding must include a concrete fix.

Prefer the **smallest sensible change** that addresses the underlying problem.

Don't propose a large rewrite when a small refactoring solves the issue.

If a larger architectural change is warranted, explain the reason briefly.

## Avoid false positives

Do not flag:

* Personal style preferences.
* Formatting handled by tooling.
* Minor naming preferences where the current name is clear.
* Theoretical future problems with no plausible impact.
* Alternative implementations that are merely different.
* Intentional duplication.
* Comments simply because you prefer no comments.

A finding should survive:

> "Would I actually ask someone to change this in a real code review?"

If not, don't report it.

## Output

Start with a **brief overall assessment**.

Then list findings in descending order of importance.

Number findings sequentially:

```text
### [1] [High] Duplicated permission logic

**Problem:** `UserService` and `AdminService` implement the same permission check.

**Why:** The two implementations can diverge when the authorization rules change.

**Fix:** Extract the check into `canManageUser()` and use it from both services.
```

Keep each finding concise. **Do not write an essay for any individual finding.**

After the findings, provide:

### Suggested changes

List recommended changes in priority order, referencing the finding numbers:

1. **[1]** Extract the shared permission check.
2. **[3]** Simplify the state handling.
3. **[2]** Add coverage for the error path.

If there are no meaningful issues, say so explicitly. Do not invent findings to make the review appear thorough.

## Review standard

Be **honest, selective, and useful**.

The quality of the review is measured by whether the developer can make better decisions from it—not by the number or length of findings.

It is perfectly valid to say:

> "This is reasonable. No changes needed."

It is equally valid to say:

> "This works, but the abstraction is unnecessary and makes the code harder to follow. I'd simplify it."

Don't optimize for the number of findings. Optimize for **signal over volume**.
