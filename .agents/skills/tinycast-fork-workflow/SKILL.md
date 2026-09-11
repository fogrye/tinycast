---
name: tinycast-fork-workflow
description: Execute a user-selected Tinycast fork issue through implementation, native verification, and merge to fogrye/tinycast dev without any upstream interaction.
alwaysApply: true
---

# Tinycast fork workflow

Use this workflow only for Tinycast work.

## Scope

- Work only on an issue the user has created and selected in `fogrye/tinycast`.
- Never browse, fetch, pull from, push to, comment on, open a pull request to, or otherwise act on `abue-ammar/tinycast`.
- Do not create or select issues. The user owns issue choice.
- Treat `origin/dev` as the integration branch. Never open a pull request for this workflow.

## Start

1. Refresh only `origin/dev`.
2. Create a dedicated `fix/<issue>-<slug>` worktree from `origin/dev`.
3. Read the issue, trace the affected flow and callers, and reuse the established local pattern.
4. Reproduce the report or establish the observable acceptance case before editing.

## Implement and verify

1. Make the smallest root-cause change. Do not add compatibility layers, speculative abstractions, or unrelated cleanup.
2. Extend the existing standalone harness with a regression case when it owns the changed behavior. Add a new harness only when no existing harness can express the contract; register it in `Scripts/run-tests.sh` with the shipped sources it guards.
3. While iterating, run the affected harness. Before integration, run the full harness suite, lint, Model-layer purity check, and Debug and Release compilation with no new warnings. Run XcodeGen only when `project.yml` changed.
4. Build the signed Debug channel at `build/DerivedData`. Launch `Tinycast Dev.app`, exercise the changed path and neighboring paths from the scoped manual regression sweep, and record observed behavior. For visual changes, capture a side-by-side before/after video. Measure/leak-test when the change can affect memory or ownership.

## Integrate

1. Review the diff and commit the focused change on the worktree branch.
2. Rebase the branch on current `origin/dev` if needed; fast-forward it into the `dev` worktree.
3. Push only `origin/dev`.
4. Close only the user-selected fork issue after the `dev` push succeeds. Comment with the commit and exact verification evidence.
5. Report the merged commit, commands/tests, manual behavior observed, and any remaining limitation.
