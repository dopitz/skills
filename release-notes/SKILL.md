---
name: release-notes
description: Write or update entries in RELEASE_NOTES.md (or CHANGELOG) for the most recent/unreleased version section. Use when asked to add release notes, update the changelog, document changes for a release, or summarize what changed for users. Applies a strict user-impact filter and a fixed set of H3 headings.
---

# Release Notes

Add the relevant content to the **most recent version section** of `RELEASE_NOTES.md`.

Only include changes that matter to existing public users of this project. Prioritize user impact over implementation detail.

## Headings

Use **only** these H3 headings, in this exact order. Omit any heading with no applicable entries.

```
### New Features

### Improvements

### Bug Fixes

### Breaking Changes

### Deprecations

### Known Issues
```

## Rules

- Include only public, user-facing changes.
- Exclude internals, refactors, test changes, tooling, CI, and other maintenance work unless they directly affect users.
- Put documentation updates under **Improvements** when they are genuinely useful to existing users.
- Keep every entry extremely brief and factual — prefer a single sentence or short bullet.
- Do not explain implementation details or provide background.
- Do not inflate minor changes into release-note items.
- Do not invent or infer user impact that is not supported by the changes.
- Preserve the existing release-notes style and formatting.
- Prefer a small number of high-value entries over exhaustive coverage.

## Inclusion test

Before including an item, ask:

> **"Would an existing user who already knows and uses this project actually care about this?"**

If not, leave it out.
