# Progress — November 3, 2026

AI-assisted project save. The team retains the final KPI/problem choice and merges the review branch.

## Completed

- Reviewed the two shown table schemas and documented mismatched station identifiers and snapshot-versus-history limits.
- Collected ten baseline KPI exports and summarized their definitions, measured results and caveats.
- Replaced an unequal annual comparison with matched April/May 2017–2018 comparisons.
- Received monthly rider mix, segment-duration and Customer duration-band results.
- Isolated the duration spike to a small set of Customer records exceeding 24 hours.
- Preserved all 14 user-supplied result files in the evidence archive, including the exploratory sample output.
- Saved the working analysis, query templates and exact follow-up SQL text. Queries prepared but not executed are under `sql/drafts/`.

## Current leading finding

417 Customer records exceeding 24 hours account for 41.51% of Customer recorded trip minutes for May 2018. The all-rider mean increase falls from 14.1% to 1.5% when that group is omitted for sensitivity analysis. The underlying cause remains unconfirmed.

## Next action

Review the draft timestamp-check query, check its estimated bytes in BigQuery, and run it if accepted. Compare recorded duration with recorded start/stop differences for May 2017 and May 2018. No output for this query has been supplied yet.

## Remaining assignment decisions

- Team confirmation of one KPI and a specific business problem.
- Formal industry definition/source and any appropriate external benchmark.
- A chart of the selected comparison.
- Cause investigation and an evidence-supported action.
- Whether a model would answer a useful question.

## Save and review status

This package was uploaded by the agent on a review branch. The team has not been recorded as verifying the findings or approving an audit entry. `audit_log.md`, `audit_protocol.md`, `AGENTS.md` and the charter are preserved.
