---
name: assisted-reading
description: Create exhaustive, dependency-ordered source reading guides for a codebase, component, branch changes, or commits, with detailed steps that introduce concepts before use.
---

# Assisted reading

Build a detailed itinerary through the actual source: what to read next, what it
means, and how it connects to prior steps. Assume the reader knows nothing about
the selected implementation; for change scopes, nothing about what was added or
changed. A symbol list or architecture summary is insufficient.

## Scope

- Honor the user's scope, exclusions, assumed knowledge and output constraints.
  State the target, comparison base and prerequisites. Infer these from context;
  clarify material ambiguity rather than selecting an arbitrary base.
- Support whole repositories, components/paths, branch changes, commits/ranges
  and staged/worktree changes. Branch changes use the intended merge base;
  a commit uses its comparison parent. Keep unrelated working changes separate.
- Use diffs to select work, then read complete affected definitions and their
  dependencies. Explain unchanged code as needed for integration. Account for
  tests, build wiring, generated/vendor code and configuration variants explicitly.
- Describe the target implementation. Explain removals or historical behavior
  only where needed to understand the selected change.

## Inventory and order

Read all selected source. Maintain a coverage ledger mapping every in-scope type,
field, function, private helper, callback, macro, constant and supporting state to
its prerequisites and teaching step. Include meaningful control paths, cleanup,
concurrency and build dependencies. Record exclusions; links alone are not coverage.

Order by conceptual dependencies, starting with isolated contracts and helpers,
then composing them into larger mechanisms and complete flows. Inspect the actual
assigned source spans: every unfamiliar symbol or concept must be introduced
before use, including field types and indirect callback dependencies. Introduce
external contracts beyond the reader's declared language/framework knowledge.

The only exception is a clearly marked overview that improves understanding,
followed by linked detailed steps. Use this for dependency cycles when necessary;
an overview does not satisfy detailed coverage.

## Output structure

Use an overview with scope, prerequisites, progression diagram and chapter links,
then chapter pages with numbered steps and substeps. Continue step numbers across
chapters; number substeps `N.1`, `N.2`, etc. Follow this shape unless the user
explicitly requests another format:

```markdown
# Chapter title

## N. Concept to understand

One short sentence connecting this step to prior knowledge.

### N.1. Specific reading action

Read [symbol or declaration](source-link): exact fields, branch or statement span.

One short commentary sentence explaining what matters in this span and why.

**Checkpoint — you should know:**

- Concrete knowledge established by this substep.
- Another concrete outcome about behavior, ownership or relationships.

### N.2. Next reading action

Read [next symbol](source-link): exact span.

One short commentary sentence.

**Checkpoint — you should know:**

- Concrete outcome.
- Another concrete outcome.

### N.3. Trivial reading action

Read [trivial symbol](source-link): exact span.

One short commentary sentence.
```

Keep the reading target and one-line commentary separate. Add a focused excerpt,
diagram or table between commentary and checkpoint only when it helps. Checkpoints
are required except for very trivial material, where they are optional; retain the
reading target and one-line commentary. When included, checkpoints state multiple
learning outcomes, never questions/tasks or unexplained new concepts.

Split headers and function bodies as finely as needed. Explain fields, states,
initialization and lifetime; signatures, results, meaningful branches, loops and
cleanup; ownership on success/rejection; callback registration through invocation;
and relevant concurrency contracts. Introduce prerequisites before the assigned span.

Achieve detail through more precise substeps, not longer commentary. Never replace
explanations with "read the header," "follow the helpers," or a bare function list.
Group related units only when each remains explicitly explained.

## Assemble and verify

- Group steps into coherent chapters with an overview diagram and navigation.
  After teaching the parts, trace complete normal, failure and lifecycle flows,
  including integration with existing code for change scopes.
- Follow project documentation style. Prefer diagrams/graphs, tables, lists, then
  prose when useful. Include focused source excerpts for central or complicated
  code, mark omissions, and link definitions at the correct revision.
- Add a coverage index linking inventoried units to teaching steps. Preserve
  existing references when reorganizing. Leave functional source unchanged unless requested.
- **Coverage audit:** reconcile every selected unit and meaningful path against
  the guide. Resolve omissions; report any remaining gap without claiming completeness.
- **First-encounter audit:** walk the guide and assigned code in order, tracking
  known concepts. Fix unexplained dependencies by adding/reordering steps or
  narrowing source spans; allow only the marked overview exception.
- Verify excerpts, source links, anchors, navigation and the documentation build;
  preview changed diagrams or complex formatting where supported.
