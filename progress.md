# Project Progress

## Current stage

**Stage 6 — Review, audit, and merge (complete).** CP0 and CP1 deliverables are marked Completed in [checkpoints.md](checkpoints.md), and the completed `riley-setup` work has been merged into `main` on GitHub. The CP1 submission and instructor-review outcome have not yet been recorded. The gap, benchmark, Option C valuation (`~$55.6K–$335.2K/yr` ceiling), and both charts are recorded in [findings.md](findings.md); Riley verified the chart values against Queries 14 and 16 (audit #10).

## Project stages

Riley decides when a stage is complete and when to move on. Stages can overlap or be revisited. The "done when" tests are working guides, not approved rules.

| Stage | Goal | Done when | Main files | Status |
|---|---|---|---|---|
| 0. Setup | Organize the repo, roles, and workflow | Roles, approvals, and file map are recorded | [AGENTS.md](AGENTS.md), [README.md](README.md) | Done |
| 1. Descriptive exploration | Understand tables, coverage, data quality, and patterns | Riley judges the setting is understood well enough to choose a problem | [findings.md](findings.md), [sql/README.md](sql/README.md) | Done (queries 01–12) |
| 2. Data-quality and cleaning decisions | Turn data checks into approved cleaning rules | Each rule needed for the analysis is approved in [decisions.md](decisions.md) | [sql/README.md](sql/README.md#cleaning-choices-to-resolve), [decisions.md](decisions.md) | Approved: C1 exclude blank rows; C2 trips over 24 hours via `tripduration`, June 2017–May 2018 only. Birth years not needed for this problem |
| 3. Problem selection | Choose the business question, manager's decision, KPI, formula, and output row | Riley approves them, and they are recorded in [charter.md](charter.md) and [decisions.md](decisions.md) | [charter.md](charter.md) | Done 2026-11-05 |
| 4. Gap and benchmark | Measure the gap against a justified benchmark | Gap query run and benchmark approved | [findings.md](findings.md), `sql/` | Done 2026-11-05. Customer 15.98 vs. Subscriber 1.05 >24h trips per 10,000 trips (+14.93 / 15.2×; 20,736.7 excess bike-days) verified in BigQuery via Query 16 (audit #9) and written in findings.md |
| 5. Value and chart (CP1) | Calculate the gap's value with sourced inputs and build the chart | Value math sourced; chart saved in `visuals/` and embedded in findings | [findings.md](findings.md), [visuals/](visuals/) | Done 2026-11-09. Option C valuation (~$55.6K casual-pass to ~$335.2K system-wide ride-fee ceiling/yr; rule V1, audit #8) is recorded; primary comparison and supplementary monthly trend PNGs are saved and embedded in findings.md |
| 6. Review, audit, and merge | Human checks and merge to `main` | Audit entries recorded, and Riley manually merges `riley-setup` to `main` on GitHub | [Other/audit_log.md](Other/audit_log.md) | Done 2026-11-09. Human checks #8–#10 are logged, and Riley merged the completed `riley-setup` work into `main` on GitHub. |

**Next step:** Record the CP1 submission and instructor-review outcome when it is known. After CP1, the station breakdown and final recommendation scope remain open.

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

The CP0 and CP1 deliverables are complete and merged into `main` (see [checkpoints.md](checkpoints.md), [decisions.md](decisions.md), and [findings.md](findings.md)). The chart check is logged as audit #10. Still unrecorded: CP1 submission and instructor-review outcome. Post-CP1 work includes the station breakdown and final recommendation scope.

## Resuming work

Read the repo, then wait for the project lead's direction. Propose one small next action relevant to that direction. Updates to files and Git publishing retain their respective approval requirements.

The instructor grades main. At milestones or session end, update `progress.md` and `decisions.md` (with approval), supply Terminal commands for Riley to commit and push to `riley-setup`, and Riley manually merges `riley-setup` into `main` on GitHub.
