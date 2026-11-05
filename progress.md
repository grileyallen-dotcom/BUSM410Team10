# Project Progress

## Current stage

**Stage 1 — Descriptive exploration (in progress).** Queries 01–12 have been run and documented in [findings.md](findings.md) and [sql/README.md](sql/README.md). The business problem and KPI remain open.

## Project stages

Riley decides when a stage is complete and when to move on. Stages can overlap or be revisited. The "done when" tests are working guides, not approved rules.

| Stage | Goal | Done when | Main files | Status |
|---|---|---|---|---|
| 0. Setup | Organize the repo, roles, and workflow | Roles, approvals, and file map are recorded | [AGENTS.md](AGENTS.md), [README.md](README.md) | Done |
| 1. Descriptive exploration | Understand tables, coverage, data quality, and patterns | Riley judges the setting is understood well enough to choose a problem | [findings.md](findings.md), [sql/README.md](sql/README.md) | **In progress** (queries 01–12) |
| 2. Data-quality and cleaning decisions | Turn data checks into approved cleaning rules | Each rule needed for the analysis is approved in [decisions.md](decisions.md) | [sql/README.md](sql/README.md#cleaning-choices-to-resolve), [decisions.md](decisions.md) | Started. Approved: C1 exclude blank rows. Open: >24h trips, birth years, coverage gaps |
| 3. Problem selection | Choose the business question, manager's decision, KPI, formula, and output row | Riley approves them, and they are recorded in [charter.md](charter.md) and [decisions.md](decisions.md) | [charter.md](charter.md) | Not started |
| 4. Gap and benchmark | Measure the gap against a justified benchmark | Gap query run and benchmark approved | [findings.md](findings.md), `sql/` | Not started |
| 5. Value and chart (CP1) | Calculate the gap's value with sourced inputs and build the chart | Value math sourced; chart saved in `visuals/` and embedded in findings | [findings.md](findings.md), [visuals/](visuals/) | Not started |
| 6. Review, audit, and merge | Human checks, partner review, and merge to `main` | Audit entries recorded, Rainy has reviewed, and Riley approves the merge | [Other/audit_log.md](Other/audit_log.md) | Not started |

**Next step:** Riley chooses whether to continue Stage 1 exploration or begin Stage 2 cleaning decisions.

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

Business problem, manager's decision, business KPI and formula, analysis output row, benchmark, valuation inputs, and recommendation scope are TBD. Earlier problem-specific ideas are not the current direction.

## Resuming work

Read the repo, then wait for the project lead's direction. Propose one small next action relevant to that direction. Updates to files and Git publishing retain their respective approval requirements.

The instructor grades main. Partner review and explicit merge approval are required before completed branch work is merged.
