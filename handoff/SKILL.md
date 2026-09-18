---
name: handoff
description: "Compress the current context into a Markdown handoff for another agent."
---

Create a concise handoff from the current context.

Capture only the information another agent needs to continue:

- Goal, current state, potentially active ticket/spec.
- Decisions, constraints, and existing authorizations.
- Completed/outstanding work, validation results, and blockers.
- Relevant files, revision/worktree state, commands, and references.
- Exact next action and any prerequisite resolution.

Remove repetition, irrelevant discussion, and unnecessary reasoning.

Write the result to handoff.md.
