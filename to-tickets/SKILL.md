---
name: to-tickets
description: Break a spec, plan, or conversation into independently verifiable vertical-slice tickets with dependencies, writing Markdown files and an index to the user's chosen folder.
disable-model-invocation: true
---

Read the supplied source and relevant code, tests, terminology, and ADRs. Preserve resolved decisions unless code contradicts them. Ask only about consequential missing information; use an output folder already chosen in context, or ask for one.

## Shape the work

- Create small end-to-end slices, each independently verifiable and sized for one fresh agent context. Include directly useful prefactoring; avoid separate tickets merely for technical layers.
- Carry source decisions and validation seams into tickets so [implement](../implement/SKILL.md) can work without the original conversation. If conversation is the only source, summarize the necessary decisions locally.
- For wide mechanical refactors, use **expand → migrate → contract**. Migration batches depend on expansion; contraction depends on every migration. Keep intermediate states verifiable.
- Declare only real blocking dependencies. Number tickets from `01` in dependency order; avoid cycles.
- Write reviewable drafts directly without a mandatory approval interview. Preserve explicit user requests to review the plan first.

## Files

Write one `NN-<slug>.md` per ticket and `00-index.md` inside the chosen folder. Do not publish to a tracker. Preserve unrelated existing content; if an existing file's intended treatment is unclear, ask before replacing it.

```markdown
# 01 — <Title>

**Status:** Todo

**Source:** <Spec path/URL and relevant section, or summarized conversation decisions>

**What to build:** <End-to-end behavior and essential constraints>

**Blocked by:** None

**Validation:** <Behavioral seams, cases, and applicable checks>

## Acceptance criteria

- [ ] <Observable, verifiable outcome>
```

For dependencies, replace `None` with relative links to prerequisite tickets. Describe behavior and durable contracts rather than prescribing transient file paths, class names, or implementation steps. A small prototype-derived schema/state machine is appropriate when it captures an essential decision precisely.

Implementation adds completion evidence as work proceeds. Ticket status is authoritative; the index mirrors completion using checkboxes:

```markdown
# <Feature>

<One-sentence description and source reference, if available.>

- [ ] [01 — <Title>](./01-<slug>.md)
- [ ] [02 — <Title>](./02-<slug>.md)
```

Keep dependencies and acceptance criteria in tickets, not duplicated in the index.

## Verify

Check coverage of requested behavior, useful slice boundaries, source/validation context, observable criteria, and minimal acyclic dependencies. Verify every ticket is indexed and every local ticket/dependency link resolves. Report unresolved planning decisions rather than disguising them as implementation-ready work.
