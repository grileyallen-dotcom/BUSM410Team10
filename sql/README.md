# SQL query guide

This file explains how the project queries the data, reviews cleaning choices, and traces reported numbers to their queries and results.

## Current status

No approved, executed numbered analysis queries are recorded in the repo yet. The gap, benchmark, and cleaning decisions are still pending. The supplied dataset images report profiling results, but their underlying profiling SQL and outputs were not supplied.

See [dataset documentation](../Other/metadata.pdf), the [table diagram](../Other/ERD.pdf), and [documentation notes](../Other/dataset_documentation.md) for the supplied schema information and its limits.

## Existing query register

| File | Purpose and scope | Approval and execution status | Estimated scan and cost | Result |
|---|---|---|---|---|
| [drafts/extreme_duration_timestamp_check.sql](drafts/extreme_duration_timestamp_check.sql) | Compare recorded and timestamp-derived durations for Customer trips over 24 hours in May 2017 and May 2018 | Existing draft; no query approval or execution result recorded | Not recorded; obtain a BigQuery estimate before running | Not recorded |

This draft does not establish the project's selected gap, cleaning policy, or accepted analysis.

## How we develop queries

1. The agent proposes one short query and explains its purpose, what one output row represents, the required fields, and important filters or joins.
2. Confirm the required tables and columns. Review the estimated scan and cost, including its source and pricing assumptions. If the estimate is unavailable, request the BigQuery editor's estimate; do not invent one.
3. Review and approve the query. Saving it to the repo requires explicit approval of the proposed file change.
4. The student runs the query in BigQuery and supplies the result and available execution details.
5. The agent analyzes and explains the result, discusses limitations, and asks before recording an interpretation as an approved project conclusion.
6. Propose updates to these notes and the query register for approval. Publishing the file changes requires separate approval.

Accepted queries use one numbered file per step, such as `01_exploration.sql` and `02_cleaning_checks.sql`. Each file begins with a short comment pointing here, for example:

```sql
-- Step 1: Explore the selected comparison. See sql/README.md for notes.
```

Drafts remain in `drafts/` until their purpose and query have been accepted.

## Cleaning choices to resolve

The following items come from the supplied documentation or the assignment. No filter, exclusion, join method, or duration rule is adopted merely by listing it here.

| Issue | What needs checking before a decision |
|---|---|
| Blank rows and missing fields | Define valid records for the selected metric, count relevant missing values, and document inclusion and exclusion rules. |
| Duplicate events | There is no reported trip ID. Investigate candidate duplicate definitions; a hash is not proof of uniqueness. |
| Durations and timestamps | Investigate long trips, invalid values, and disagreements between recorded duration and timestamp differences. Explain any threshold or choice of duration field. |
| Rider fields | If used, assess missing or implausible birth years and the meaning of rider categories. |
| Station data and joins | Investigate missing or zero values, name changes, ambiguous matches, unmatched trips, and row multiplication. The suggested crosswalk has not been built or adopted. |
| Time coverage | Account for partial first and last years, incomplete periods, and stations that opened or closed. Current station capacity and status do not establish historical conditions. |

After checks are run, record the query, evidence, proposed rule, effect on the analysis, and approved decision here.

## What to record for each accepted step

- Numbered SQL file, purpose, confirmed columns, and output row meaning.
- Data period, comparison groups, filters, joins, and cleaning choices with their reasons.
- Estimated bytes and cost with the source, date, and pricing assumptions; actual execution details when supplied.
- Result values with a traceable result reference, limitations, and the decision supported.
- Approval and execution status, including unresolved questions.

Keep the query results, [findings](../findings.md), [charter](../charter.md), charts, and main README consistent when their updates are approved. Preserve the source and calculation behind each reported number.

## Sheets, visuals, and data files

If Google Sheets is used, add the sheet link and formulas here. Add chart calculation and source references when a chart is created. Keep CSV and Excel data files out of the repo.

