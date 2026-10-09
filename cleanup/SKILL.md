---
name: cleanup
description: Review temporary project material, generated output and historical evidence, recommend keep/delete in a compact table, then carry out the user's selected deletions and repair current references.
---

Invocation starts a read-only assessment. Follow any directions about what or
where to inspect; otherwise look across the project, including hidden or ignored
paths.

## Candidates

- **Planning and investigation:** contents of .scratch/, temporary tickets, implementation plans, probes
  and reading guides.
- **Build output:** build folders, compiled bundles and intermediate generated files.
- **Caches:** compiler, tool and test caches.
- **Logs:** debug logs, execution logs and diagnostic traces.
- **Reports:** coverage reports and generated test or analysis reports.
- **Historical evidence:** old verification results, investigation notes and saved
  screenshots.
- **Other temporary artifacts:** scratch files, temporary exports and leftover
  working directories.

## Review

- Assess candidates by remaining purpose; being generated, ignored or old does
  not by itself justify deletion. Check current ticket status where relevant,
  incoming references, build/test dependencies and reproducibility of generated
  artifacts.
  Production source, maintained tests and normal project files are not cleanup
  candidates; inspect them only as supporting context.
- Preserve information still needed for current requirements, decisions or
  unresolved investigations. Recommend deletion when an artifact has no remaining
  purpose, including historical evidence. Identify any unique findings still
  needed for current work that must first be retained elsewhere.
- Return a compact table: **Path | Recommendation | Reason**. Use only **KEEP**
  or **DELETE**, with one-line reasoning. Use **KEEP** when an artifact's purpose
  or dependencies remain unclear, explaining what needs resolving. List cleanup
  candidates only, not the whole workspace. Group a folder when all its
  contents share the same recommendation and reason; split mixed folders as needed.

After presenting the assessment, follow the user's latest explicit deletion
selection if one is already authorized in this conversation. Otherwise, wait for
user review and a deletion instruction. Corrections to recommendations alone do
not authorize deletion; do not ask again for approval already given.

## Delete and verify

Preserve only findings still needed for current work before deleting their source
artifacts.
Remove only the selected artifacts and directories made empty by those deletions.
Repair or remove affected links and obsolete commands so retained files describe
the current state. Do not create deletion ledgers, replacement notices or
historical "used to be" notes about deleted artifacts in retained files.

Confirm removals and check references, inspecting ignored files directly because
Git diffs omit them. Run affected checks only where dependencies warrant them.
Briefly report deletions, reference repairs and verification to the user.

If the user also requests next-ticket viability, compare its requirements with
current code and evidence. Report completed work, missing deliverables, stale
assumptions and blockers separately; do not begin implementation.
