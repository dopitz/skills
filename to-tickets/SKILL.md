---

name: to-tickets
description: Break a plan, spec, or conversation into tracer-bullet tickets with explicit blocking edges. Write each ticket as a Markdown file plus a minimal index to a user-specified folder.
disable-model-invocation: true
---

# To Tickets

Break the provided plan, spec, or conversation into **tracer-bullet tickets**: small, end-to-end vertical slices that can be implemented and verified independently.

Tickets are always written as individual `.md` files to a **folder specified by the user**. Also create a minimal `00-index.md` linking to every ticket listing dependencies.

This skill has no external dependencies or issue-tracker integration.

If no output folder is provided, ask the user for one. Never choose a folder yourself.

## 1. Gather context

Work from the existing conversation.

If the user provides a local document or other reference, read it fully before planning.

Preserve decisions already made. Do not reopen resolved questions unless the codebase contradicts them.

## 2. Explore the codebase

If working in an existing repository, explore the relevant code before creating tickets.

Understand the existing architecture, domain terminology, tests, interfaces, schemas, and relevant ADRs.

Use existing terminology.

Look for useful prefactoring opportunities:

> Make the change easy, then make the easy change.

Only include prefactoring when it directly makes the requested work easier.

## 3. Create vertical slices

Break the work into narrow, complete **vertical slices**, not horizontal technical tasks.

Each ticket should:

* Deliver meaningful end-to-end behaviour
* Be independently demoable or verifiable
* Fit in a single fresh agent context window
* Have clear acceptance criteria
* Have explicit blocking edges

A ticket may span schema, backend, API, UI, and tests when necessary.

Do not create separate tickets simply for separate technical layers.

Prefer:

```text
User can create a draft
User can edit a draft
User can publish a draft
```

over:

```text
Create database
Build API
Build UI
Add tests
```

## 4. Handle wide refactors

Wide mechanical refactors are the exception to vertical slicing.

Use **expand → migrate → contract**:

1. Add the new form alongside the old without breaking callers.
2. Migrate callers in independently-sized batches.
3. Remove the old form once all callers have migrated.

Migration tickets depend on expand. Contract depends on all migration tickets.

If migration batches cannot remain green independently, keep the dependency sequence and use an integration branch as necessary.

## 5. Define blocking edges

Every ticket must declare what blocks it.

Use:

```text
Blocked by: None — can start immediately
```

or:

```text
Blocked by:
- 01 — Create workspace
- 02 — Add membership
```

Only create a dependency when the earlier ticket genuinely gates the later one.

Prefer the smallest dependency graph possible so independent tickets can run in parallel.

Number tickets from `01` in dependency order.

## 6. Quiz the user

Before creating files, present the proposed tickets as a numbered list containing:

* **Title**
* **Blocked by**
* **What it delivers**

Ask:

* Is the granularity right?
* Are the blocking edges correct?
* Should anything be merged?
* Should anything be split?
* Is anything missing?

Iterate until the user approves.

**Do not create files before approval.**

## 7. Write the tickets

After approval, create:

```text
<output-folder>/
├── 00-index.md
├── 01-<slug>.md
├── 02-<slug>.md
└── ...
```

Create exactly one `.md` file per ticket.

Never publish to an external tracker.

Never silently overwrite existing files. If an intended file exists, ask the user what to do.

### Ticket template

```markdown
# 01 — <Ticket title>

**What to build:** <End-to-end behaviour this ticket makes possible, from the user's perspective.>

**Blocked by:** None — can start immediately

## Acceptance criteria

- [ ] <Criterion 1>
- [ ] <Criterion 2>
```

For dependencies:

```markdown
**Blocked by:**
- 01 — <Ticket title>
- 02 — <Ticket title>
```

### Ticket content

`What to build` describes behaviour, not implementation steps.

Acceptance criteria must be observable and verifiable.

Avoid brittle details such as file paths, line numbers, exact class/function names, or temporary implementation choices.

Exception: include a small prototype-derived state machine, schema, reducer, or type shape when it communicates an important decision more precisely than prose.

## 8. Write the index

`00-index.md` is the single entry point to the ticket set.

Keep it intentionally minimal:

```markdown
# <Feature>

Implementation tickets for <feature>.

1. [01 — Create workspace](./01-create-workspace.md)
2. [02 — Configure workspace](./02-configure-workspace.md)
3. [03 — Invite members](./03-invite-members.md)
```

It must contain:

* A title
* One short description
* One relative Markdown link per ticket

Do not duplicate ticket content, acceptance criteria, or implementation details.

## Final checks

Before finishing, verify:

* Every requested behaviour is covered.
* Tickets are genuine vertical slices.
* No circular dependencies exist.
* Dependencies are minimal and correct.
* Tickets are numbered in dependency order.
* Every ticket has acceptance criteria and blocking edges.
* `00-index.md` links to every ticket.
* Every index link points to an existing file.
* No extra ticket files were created.
* Nothing was written outside the user-specified folder.
