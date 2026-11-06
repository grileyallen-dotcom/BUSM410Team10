# Project Progress

## Current stage

**Stage 4 — Gap and benchmark (in progress).** Riley selected the business problem on 2026-11-05: Customer trips over 24 hours vs. the Subscriber benchmark, June 2017–May 2018 (see [charter.md](charter.md) and [decisions.md](decisions.md)). Queries 13–15 have been run. CP1 is due 2026-11-06.

## Project stages

Riley decides when a stage is complete and when to move on. Stages can overlap or be revisited. The "done when" tests are working guides, not approved rules.

| Stage | Goal | Done when | Main files | Status |
|---|---|---|---|---|
| 0. Setup | Organize the repo, roles, and workflow | Roles, approvals, and file map are recorded | [AGENTS.md](AGENTS.md), [README.md](README.md) | Done |
| 1. Descriptive exploration | Understand tables, coverage, data quality, and patterns | Riley judges the setting is understood well enough to choose a problem | [findings.md](findings.md), [sql/README.md](sql/README.md) | Done (queries 01–12) |
| 2. Data-quality and cleaning decisions | Turn data checks into approved cleaning rules | Each rule needed for the analysis is approved in [decisions.md](decisions.md) | [sql/README.md](sql/README.md#cleaning-choices-to-resolve), [decisions.md](decisions.md) | Approved: C1 exclude blank rows; C2 trips over 24 hours via `tripduration`, June 2017–May 2018 only. Birth years not needed for this problem |
| 3. Problem selection | Choose the business question, manager's decision, KPI, formula, and output row | Riley approves them, and they are recorded in [charter.md](charter.md) and [decisions.md](decisions.md) | [charter.md](charter.md) | Done 2026-11-05 |
| 4. Gap and benchmark | Measure the gap against a justified benchmark | Gap query run and benchmark approved | [findings.md](findings.md), `sql/` | In progress. Customer 15.98 vs. Subscriber 1.05 trips over 24 hours per 10,000 trips (Query 14). Period totals were added up by hand and still need a human check; findings.md not yet updated |
| 5. Value and chart (CP1) | Calculate the gap's value with sourced inputs and build the chart | Value math sourced; chart saved in `visuals/` and embedded in findings | [findings.md](findings.md), [visuals/](visuals/) | In progress. Proposed lost-ride value of about $391K per year (a ceiling): 20,736.7 bike-days × 6.29 trips per bike-day (Query 15) × $3. Valuation method and $3 source not yet approved or checked; chart on hold |
| 6. Review, audit, and merge | Human checks and merge to `main` | Audit entries recorded, and Riley manually merges `riley-setup` to `main` on GitHub | [Other/audit_log.md](Other/audit_log.md) | Not started |

**Next step:** Write the gap, benchmark, and value sections in findings.md; verify the $3 price source; build the chart; update the gap and cleaning-rule facts in AGENTS.md; log a human check.

## Repo organization

| Area | Purpose |
|---|---|
| [AGENTS.md](AGENTS.md) | Roles, approvals, communication, session startup, and evidence rules |
| [README.md](README.md) | Project identity and file map |
| [decisions.md](decisions.md) | Stated direction and open choices |
| [charter.md](charter.md) | Framework for the future question, decision, scope, and success criteria |
| [findings.md](findings.md) | Descriptive context and later supported findings |
| [sql/README.md](sql/README.md) | Query intake, review, documentation, execution status, and results |
| [Source notes](Other/dataset_documentation.md) | Supplied dataset descriptions and verification limits |
| [Audit protocol](Other/audit_protocol.md) and [audit log](Other/audit_log.md) | Checking process and real human checks |

The repo includes supplied documentation PDFs, schema screenshots, an ERD, and an existing SQL draft. Their presence does not establish execution, validation, or selection of a business problem.

## Open choices

The problem, KPI, benchmark, and period are now chosen (see decisions.md). Still open: the valuation method and inputs, the chart, the station breakdown, and the recommendation scope.

## Resuming work

Read the repo, then wait for the project lead's direction. Propose one small next action relevant to that direction. Updates to files and Git publishing retain their respective approval requirements.

The instructor grades main. At milestones or session end, update `progress.md` and `decisions.md` (with approval), supply Terminal commands for Riley to commit and push to `riley-setup`, and Riley manually merges `riley-setup` into `main` on GitHub.
