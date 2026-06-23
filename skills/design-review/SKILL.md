---
name: design-review
description: Run a design-review session on an existing page — create the branch, invoke frontend-design, build incrementally with screenshots, then PR into develop. Use when visually overhauling an existing page or section.
disable-model-invocation: true
---
# Design Review

Wraps the `frontend-design` skill with the correct lifecycle for visual overhaul sessions. Five steps, in order.

## 1. Create the branch

Before any critique or code, branch off `develop`:

```sh
git checkout develop && git pull
git checkout -b design-review/<page>-<YYYY-MM-DD>
```

Example: `design-review/landing-page-2026-06-17`. Do not start the session on `develop` or an existing feature branch.

## 2. Run frontend-design

Invoke the `frontend-design` skill. This skill drives the critique and build loop — follow its instructions. A few constraints that apply on top of it:

- **No GitHub issue required.** Design-review is exempt from the issues-first workflow — it's exploratory visual work, not ticket-driven. Do not create an issue or expect `Closes #N` in the PR.
- **Critique first, no code.** Review the live page before touching anything. Give the written critique and wait for the user to respond before planning.
- **Design plan second, still no code.** Present the token system (colours, type, layout, signature element) for approval before building.
- **Build one section at a time.** Only proceed to the next section after the user says go.

## 3. Screenshot every section

Before marking any section done, screenshot it. This catches real issues (wrong component used, layout off, visual regressions) that a code read won't catch. If the project supports multiple colour modes or themes, capture each.

## 4. Open the PR into develop

Once the pass is complete, run type-check and lint, then open the PR:

```sh
gh pr create --base develop --title "design-review: <page>" --body "Visual overhaul of <page>. No issue — design-review sessions are exempt from the issues-first workflow."
```

No `Closes #N`, no `awaiting-promotion` label — the normal issue lifecycle does not apply here.

## 5. Post-merge doc update

After the PR merges, invoke `/post-merge` for the doc update and develop pull — but skip the awaiting-promotion label step (there's no issue to label).
