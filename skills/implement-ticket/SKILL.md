---
name: implement-ticket
description: Pick up a GitHub issue by number and drive it from clarification through implementation, PR, a single automated review pass, and fixing the resulting remarks. Use when the user gives a bare ticket/issue number and asks to implement, pick up, or ship it (e.g. "/implement-ticket 123", "pick up ticket 123", "implement issue #123").
disable-model-invocation: true
---
# Ship Ticket

Drives a GitHub issue from number to a reviewed, fixed-up PR, then hands you a manual test plan. Six steps, run in order, no step skipped.

## 1. Fetch and check clarity

```sh
gh issue view <number>
```

Read the issue. Decide if it's specific enough to implement confidently — clear acceptance criteria, no open design questions, no ambiguous scope.

- **Not clear enough**: invoke the `grill-with-docs` skill to resolve scope with the user before writing any code. Do not proceed to implementation until that session concludes.
- **Clear**: go straight to step 2.

## 2. Implement and open the PR

Follow the repo's standard feature workflow:

- Branch off `develop` (never `main`) for the feature.
- Implement the change.
- Open the PR **into `develop`**.
- Reference the issue in the PR body (e.g. `Refs #<number>` — do not write `Closes #<number>` here; closing happens when the change is promoted to `main`, per this repo's issue lifecycle).
- Avoid pasting full file contents into chat or commit messages unless it's genuinely necessary to explain a change — a diff or a short excerpt is usually enough, and keeps things efficient without losing anything the user needs.

## 3. Spawn one review pass

Once the PR exists, spawn a fresh-context `Agent` to review it. This pass runs **exactly once** — never re-invoke review after fixes land.
Prompt the agent to:

- Run the `review` skill against the PR (give it the PR number/URL and repo). The agent should read whatever context it needs to review properly — the diff plus surrounding repo files where relevant — since a diff alone often hides bugs in callers, contracts, or imports.
- Post findings as inline PR comments (`gh api repos/.../pulls/.../comments` or equivalent) — not just a chat summary.
- Alongside the inline comments, have the agent return a compact structured summary of its findings, one entry per issue:

```json
[
  {
    "file": "path/to/file",
    "line": 0,
    "severity": "low|medium|high",
    "issue": "short description (max 2 sentences)",
    "fix": "concise suggested fix (optional)"
  }
]
```

This gives step 4 a quick, scannable index of what to triage before diving into the full PR comments.
Wait for the agent to finish before moving to step 4.

## 4. Triage the remarks

Use the structured summary from step 3 as your index, but pull the actual posted comments (`gh api repos/<owner>/<repo>/pulls/<number>/comments`) as the source of truth before acting — the summary is a guide, not a substitute for what's really on the PR. For each:

- **Makes sense** → implement the fix.
- **Out of scope / not worth doing** → leave a brief reply on that specific comment explaining why it's being skipped. Never skip silently.

## 5. Push fixes

Push the fix commits once triage is done. This is pre-authorized as part of this skill — no need to ask before pushing.

## 6. Hand off a manual test plan

Some acceptance criteria can't be verified from code alone — they need the user to run the app and check behaviour (device/simulator interactions, App Store/RevenueCat flows, permission prompts, visual results, anything the agent couldn't exercise itself). Close the workflow by handing the user a checklist so they can verify the change meets the issue's acceptance criteria.

Present it as the final message, in this shape:

```
## Manual testing — issue #<number>

What I already verified automatically: <one line, or "nothing — needs manual testing">

Please verify these yourself, in order:

1. [ ] <step — what to do, then what you should see>
2. [ ] <step …>
```

Rules for the checklist:

- Derive each step from the issue's acceptance criteria. Map every criterion to at least one check so nothing is silently dropped.
- Order the steps as a flow the user walks top to bottom (setup → action → expected result), not a flat unordered dump.
- Each step states the action **and** the expected outcome, so the user knows whether it passed.
- Cover edge cases and failure paths the criteria imply (e.g. cancel/restore, empty states, error states), not just the happy path.
- Be explicit about anything that needs special setup the user controls — a real device, a sandbox account, a paid subscription, a granted permission.
- Don't list things you already verified automatically as manual steps; note them once under "What I already verified" instead.

## Notes

- If the issue is already closed, in another branch's PR, or otherwise not actionable, stop and tell the user instead of guessing.
- This skill does not promote the PR to `main` or close the issue — that's a separate, later step.
