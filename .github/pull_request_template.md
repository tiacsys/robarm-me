## What and why

<!-- What does this PR change, and why? Link the issue it closes: "Closes #123". -->

## Checks

- [ ] `curatrix check robarm-me --stage local` passes (run from the workspace root, with CAD content where the repo has it)
- [ ] New IDs come from the ledger (`curatrix ids fix robarm-me`); no placeholders are left
- [ ] Generated files are regenerated and committed (`curatrix gen all robarm-me`)
- [ ] For a change across repos: the same branch name is used in every repo, and the other PRs are linked here
- [ ] `.FCStd` files are saved uncompressed (`curatrix launch freecad`), and their semantic JSON is committed
- [ ] The local review report (`build/robarm-me/review/<branch>/`) was checked; findings are summarized here

## Notes for the reviewer

<!-- Anything the reviewer should look at first, open questions, follow-up work. -->
