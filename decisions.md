# Project Decisions

This file records the project lead's stated direction and identifies open choices. Riley Allen is the project lead; the agent provides consulting support. Proposals and earlier exploratory ideas do not establish approval.

## Current direction

The following direction was stated by Riley in conversation on 2026-11-04.

| Area | Current direction |
|---|---|
| Roles | Riley leads and makes project decisions. The agent researches, explains, challenges, and recommends as a consultant. Rainy Villame remains the project partner. |
| Current activity | Organize the repo and establish how work is handled. A setup discussion does not authorize starting analysis. Current stage belongs in progress.md and may change when Riley directs it. |
| Analytical sequence | Descriptive analytics first, then selection of a business problem informed by the evidence. |
| Business problem and business KPI | Not selected. Earlier problem-specific ideas have been reopened and are not active instructions. |
| Analysis output row, benchmark, valuation, and recommendations | Open; select after descriptive exploration and project-lead approval. |
| Existing data boundary | Citi Bike operations during 2013-2018 using the existing dataset only. |
| Read access | Reading files, repo inspection, and external research require no approval. |
| Repo changes | Show the exact proposed change and reason, then obtain explicit approval. |
| Git actions | Commits, pushes, pull requests, and merges require separate explicit approval. |
| Query execution | The agent prepares SQL when requested; Riley or a teammate runs it. |
| Communication | Short, simple replies; detail on request; direct, evidence-based disagreement. |
| Conflicting instructions | Declare the conflict. Riley may override project instructions; respect an override already given and clarify only when its meaning or scope is unclear. |
| Suggestions outside scope | May be offered in one or two sentences; implementation requires explicit approval. |
| Errors and obstacles | State them directly and propose corrections. Corrections that modify the repo require approval. |
| Shared memory | Keep the information needed for future conversations in the repo, with approval before updates. |

## Source confirmation

On 2026-11-04, Riley confirmed that `bigquery-public-data.new_york_citibike.citibike_trips` and its `starttime` column are available. This records the user's confirmation, not an independently executed query or a human audit entry.

## Approved cleaning rules

### C1. Exclude blank rows (approved 2026-11-05)

| Field | Entry |
|---|---|
| Decision-maker | Riley Allen, project lead |
| Rule | Analyses of `citibike_trips` use only rows where `starttime IS NOT NULL` |
| Effect | Excludes 5,828,994 of 58,937,715 rows (9.9%), leaving 53,108,721 trips |
| Evidence | [Query 01](sql/01_monthly_trips_and_missing_starts.sql) counted the rows. [Query 02](sql/02_blank_rows_field_check.sql) found `stoptime`, `tripduration`, `start_station_id`, `end_station_id`, and `bikeid` all null. [Query 03](sql/03_blank_rows_usertype_check.sql) found `usertype` is an empty string in every one |
| Reasoning | Agent recommendation: these rows have no time, duration, station, or bike, so they cannot represent trips. Riley approved the rule; Riley's own reasoning was not separately recorded |
| Alternatives | Keep the rows (rejected: they add no trip information); check the remaining fields first (not done; see limits) |
| Limits | Station names, coordinates, `birth_year`, `gender`, and `customer_plan` were not checked for these rows. This was checked by the agent only; there has been no human audit |

## Future decisions

For each consequential decision, propose the exact entry for approval. Record the actual decision-maker, decision, reasoning when supplied, evidence, alternatives where relevant, and unresolved limits. Do not invent reasoning or verification. If direction changes, identify the superseded decision and the new direction.
