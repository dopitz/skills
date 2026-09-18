---
name: to-spec
description: Synthesize the current conversation into a focused spec and publish it to the project issue tracker without reopening resolved decisions.
disable-model-invocation: true
---

Synthesize existing conversation and codebase evidence. Preserve settled decisions; ask only about consequential missing information that cannot be established from the repo. Design interviews belong to [grill-me](../grill-me/SKILL.md).

## Process

1. Inspect relevant code, tests, domain terminology, and ADRs unless already understood.
2. Preserve agreed testing decisions. Otherwise choose the smallest set of existing behavioral seams that provides useful coverage; explain any necessary new seam.
3. Write the spec below. Separate established decisions from assumptions and unresolved questions. Keep distinct, necessary user stories; do not inflate scope to fill the template.
4. Publish to the project's issue tracker and return its URL. Apply `ready-for-agent` only when no unresolved decision blocks implementation. If publication is unavailable, return the complete draft and identify the blocker.

## Spec structure

- **Problem:** The user's problem and desired outcome.
- **Solution:** Proposed behavior and distinct user stories with observable acceptance criteria.
- **Implementation decisions:** Relevant boundaries, contracts, architecture, and constraints already agreed. Prefer stable concepts over transient file paths or implementation recipes. Include a small prototype-derived schema or state machine only when clearer than prose.
- **Validation:** Behavioral seams, important success/error cases, and relevant existing tests. Test observable behavior rather than implementation details.
- **Out of scope:** Explicit exclusions.
- **Open questions:** Only unresolved decisions or assumptions that matter; omit when empty.

The published spec is the source reference for [to-tickets](../to-tickets/SKILL.md); carry its decisions and validation approach forward.
