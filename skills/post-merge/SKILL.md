---
name: post-merge
description: Run the post-merge checklist after a feature PR lands on develop — pull latest, add awaiting-promotion label to the issue, update CLAUDE.md/CONTEXT.md if stale, and commit docs directly to develop. Use when a feature PR has just merged into develop and you want to run the standard follow-up steps.
---
# Post-Merge

Runs the standard checklist after a feature PR merges into `develop`. Four steps, in order.

## 1. Pull latest develop

```sh
git checkout develop && git pull
```

Confirm you're on the latest `develop` before touching anything else.

## 2. Add awaiting-promotion label

```sh
gh issue edit <N> --add-label "awaiting-promotion"
```

Do this for every issue whose work landed in this PR. The issue stays open until the change is promoted to `main` — the label signals "done-in-develop, not yet shipped."

If the label doesn't exist yet:

```sh
gh label create "awaiting-promotion" --color "ededed"
```

## 3. Update docs if stale

Check both files for drift against what just merged:

- **CLAUDE.md** — structure section, data flow, conventions. Update if new lib files were added, responsibilities shifted, or patterns were renamed.
- **CONTEXT.md** — domain concepts. Update if new terms were introduced or existing definitions were sharpened.

If neither file needs updating, skip to step 4 without creating an empty commit.

## 4. Commit docs to develop

If changes were made in step 3:

```sh
git add CLAUDE.md CONTEXT.md   # or whichever changed
git commit -m "docs: update CLAUDE.md/CONTEXT.md after #<N> merge"
git push
```

Push directly to `develop` — doc-only updates do not need a PR or separate branch.

## Notes

- Do **not** put `Closes #N` in the feature PR body — closing only happens on promote to `main`. This label is the interim signal.
- If you're closing out a grill+issues session (not a feature merge), the same doc-commit step applies: commit `CONTEXT.md` and `docs/adr/` changes directly to `develop` before closing the session.
- The `promoted` label is applied during `/promote`, not here.
