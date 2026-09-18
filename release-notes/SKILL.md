---
name: release-notes
description: Update release notes or a changelog with concise user-facing changes in the unreleased or explicitly targeted version section.
---

# Release Notes

Use the project's existing release-notes/changelog file. Target an explicitly requested version; otherwise use or create an unreleased section following project conventions, leaving published releases unchanged.

Only include changes that matter to existing public users of this project. Prioritize user impact over implementation detail.

## Headings

Preserve existing heading conventions. Otherwise use these H3 headings in order, omitting empty sections:

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
