---
name: promote
description: Promote develop to main — apply any pending migrations, open the develop→main PR with Closes #N references, and after it merges swap awaiting-promotion to promoted on every resolved issue. Use when develop has been verified and is ready to ship to production.
---
# Promote

Drives the full `develop → main` promotion. Five steps, in order.

## 1. Apply pending migrations

Check CLAUDE.md for a "Pending production migrations" line. If it lists any migration files:

1. Apply each migration to the production database before opening the PR — the code that depends on them must not go live first.
2. Once applied, update the line in CLAUDE.md to read:

```
**Pending production migrations:** none currently.
```

Do not delete the line — it needs to be there as a prompt for next time.

Commit this CLAUDE.md change directly to `develop` and push before continuing.

If the line already reads "none currently," skip this step.

## 2. Identify the issues being promoted

List open issues labelled `awaiting-promotion` — these are the ones landing in this promotion:

```sh
gh issue list --label "awaiting-promotion" --state open
```

Note their numbers — you'll need them in the PR body.

## 3. Open the develop → main PR

```sh
gh pr create --base main --head develop --title "Promote develop → main" --body "$(cat <<'EOF'
## What's included

<brief summary of the changes being promoted>

## Closes

Closes #N
Closes #M

EOF
)"
```

- List a `Closes #N` line for every issue from step 2.
- `Closes` references here (not in feature PRs) is correct — this is the merge that ships to production.

## 4. Merge and confirm

Wait for the PR to merge. Verify the deploy is healthy before step 5.

## 5. Swap labels on promoted issues

For every issue that was closed by the promotion PR, swap its label:

```sh
gh issue edit <N> --remove-label "awaiting-promotion" --add-label "promoted"
```

Repeat for each closed issue. Do both operations in the same command — removing without adding the `promoted` label is incomplete.

If the `promoted` label doesn't exist yet:

```sh
gh label create "promoted" --color "0075ca"
```

## Notes

- Never put `Closes #N` in feature→develop PRs. Only here, in the promote PR.
- If the promotion PR bundles many issues and inline `Closes` references get unwieldy, close them manually post-merge rather than skipping them.
- After promotion, the `awaiting-promotion` label should be empty. If any remain, they weren't in this promotion — leave them as-is.
- Hotfixes that were branched off `main` and merged directly should be back-merged into `develop` so the fix isn't lost at the next promotion.
