---
name: plan-feature
description: Kick off a new feature — stress-test the plan with grill-with-docs, break it into tickets with to-issues, then commit any doc changes to develop. Use when you have a feature idea or rough plan and want to go from concept to a clean set of GitHub issues.
disable-model-invocation: true
---
# Plan Feature

Sequences the full feature planning workflow. Three steps, in order.

## 1. Grill the plan

Invoke the `grill-with-docs` skill. Let it run to completion — this is an interactive session that sharpens the plan against the existing domain model and updates project documentation inline as decisions crystallise. Do not move to step 2 until the session concludes and the user is happy with the outcome.

## 2. Break into tickets

Invoke the `to-issues` skill to turn the crystallised plan into independently-grabbable GitHub issues. Do not hand-roll `gh issue create` calls — `to-issues` knows how to slice a plan into tracer-bullet vertical slices.

## 3. Commit doc changes to develop

After the issues are created, check for uncommitted changes to any project documentation files (e.g. `CONTEXT.md`, `docs/adr/`, `CLAUDE.md`, or equivalent):

```sh
git status
```

If there are changes, commit and push them directly to `develop` — no branch or PR needed for doc-only updates:

```sh
git checkout develop && git pull
git add <changed doc files>
git commit -m "docs: update documentation after planning session"
git push
```

If nothing changed, skip this step.

## Notes

- Do not write any code during this skill — planning only. Implementation starts after an issue is picked up (e.g. via `/ship-ticket`).
- Do not put `Closes #N` in any commits here — that belongs in the `develop → main` promotion PR.
