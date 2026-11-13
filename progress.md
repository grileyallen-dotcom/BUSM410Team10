# Project Tracker

This file is the shared tracker for current project status, assignment checkpoints, stage progress, and dated milestones. It records documented milestones rather than every day of work. Assignment requirements are separated from the team's status and history.

## Current status

**Stage 6 — Review, audit, and merge: complete.** CP0 and CP1 project work is recorded as complete, and Riley reports that the completed `riley-setup` work was merged into `main` on GitHub. The CP1 submission and instructor-review outcome remain unrecorded. See [findings.md](findings.md) for the gap, benchmark, valuation, charts, and limitations; Riley's chart check is in [audit #10](Other/audit_log.md#verified-a-claim). Riley's correction of the agent's direct commits and push to `main` is recorded in [audit #11](Other/audit_log.md#caught-an-error).

**Next:** Record the CP1 submission and instructor-review outcome when known. The station breakdown and final recommendation scope remain open for Riley's direction.

## Assignment checkpoints

This section transcribes the CP0 and CP1 requirements recorded for the team. “Complete” below describes the team's recorded project-work status; it does not establish that a submission was made or an instructor reviewed it.

### CP0 — Team, Dataset, and Setup

- **Due:** Tuesday, October 20, 2026, 11:59 pm HST
- **Recorded status:** Project work complete
- **Goal:** Set up the team, dataset, BigQuery project, and shared project repo.

**Recorded requirements**

- `README.md` lists both partners, the fun team name, Canvas team number, dataset, and Google Cloud project ID.
- The public repo contains the required files and folders, with placeholders, including `AGENTS.md`, `charter.md`, `sql/README.md`, `model/notes.md`, `visuals/notes.md`, `Other/audit_protocol.md`, `Other/audit_log.md`, and `.agents/skills/project-audit/SKILL.md`.
- `AGENTS.md` and the project audit skill are started from the assignment templates.
- The repo includes a screenshot showing the partner and instructor were added to the BigQuery project.

### CP1 — Gap Charter

- **Due:** Friday, November 6, 2026, 11:59 pm HST
- **Recorded status:** Project work complete; submission and instructor-review outcome unrecorded
- **Goal:** Measure one data-supported gap, compare it with a justified benchmark, and explain its value.

**Recorded requirements**

- `README.md` adds problem framing and a linked guide to the project files.
- `charter.md` states the question, decision, scope, and success criteria.
- `findings.md` explains the gap, what one row represents, benchmark, difference, value calculation with a source, and chart.
- Numbered SQL files include short `--` notes; `sql/README.md` explains the query process and cleaning choices, and its numbers match `findings.md`.
- `visuals/` contains the gap chart, embedded in `findings.md`.
- `Other/` contains dataset documentation or a README link, plus a table diagram.
- `AGENTS.md` includes project facts, key tables and columns, cleaning rules, and the gap and benchmark with numbers and sources.
- `Other/audit_protocol.md` and `Other/audit_log.md` record the team's review process and human checks.

## Project stages

Riley decides when a stage is complete and when to move on. Stages can overlap or be revisited. The “done when” tests are working guides, not approved rules.

| Stage | Goal | Done when | Main files | Status |
|---|---|---|---|---|
| 0. Setup | Organize the repo, roles, and workflow | Roles, approvals, and file map are recorded | [AGENTS.md](AGENTS.md), [README.md](README.md) | Done |
| 1. Descriptive exploration | Understand tables, coverage, data quality, and patterns | Riley judges the setting is understood well enough to choose a problem | [findings.md](findings.md), [sql/README.md](sql/README.md) | Done (Queries 01–12) |
| 2. Data-quality and cleaning decisions | Turn data checks into approved cleaning rules | Each rule needed for the analysis is approved in [decisions.md](decisions.md) | [sql/README.md](sql/README.md#cleaning-choices-to-resolve), [decisions.md](decisions.md) | C1 and C2 approved; birth years not needed for this problem |
| 3. Problem selection | Choose the business question, manager's decision, KPI, formula, and output row | Riley approves them, and they are recorded in [charter.md](charter.md) and [decisions.md](decisions.md) | [charter.md](charter.md) | Done 2026-11-05 |
| 4. Gap and benchmark | Measure the gap against a justified benchmark | Gap query run and benchmark approved | [findings.md](findings.md), `sql/` | Done 2026-11-05. Customer 15.98 vs. Subscriber 1.05 trips over 24 hours per 10,000 trips (+14.93 / 15.2×; 20,736.7 excess bike-days), verified via Query 16 (audit #9) |
| 5. Value and chart (CP1) | Calculate the gap's value with sourced inputs and build the chart | Value math sourced; chart saved in `visuals/` and embedded in findings | [findings.md](findings.md), [visuals/](visuals/) | Done 2026-11-09. Option C valuation (~$55.6K casual-pass to ~$335.2K system-wide ride-fee ceiling per year; rule V1, audit #8) and both charts recorded |
| 6. Review, audit, and merge | Human checks and merge to `main` | Audit entries recorded, and Riley manually merges `riley-setup` to `main` on GitHub | [Other/audit_log.md](Other/audit_log.md) | Done 2026-11-09; Riley reports merge complete. Audit #11 records the agent's later Git-instruction error. |

## Activity history

### November 2, 2026 — Early exploration meets query-cost limits

The team began exploring Citi Bike questions with SQL drafts. Riley checked BigQuery scan estimates and asked for ways to reduce query size. These were exploratory steps; they did not establish an approved business problem or verified findings.

### November 3, 2026 — The project gets a clean GitHub home

Terminal checks showed that the old project folder was inside a Git repository rooted at Riley's home directory. Riley cloned a fresh copy of the BUSM410Team10 repository and began working on a separate branch.

### November 3–4, 2026 — Course requirements and data structure come into focus

Riley supplied the CP0 and CP1 assignment instructions, the instructor's example repository, and Citi Bike table documentation and diagrams. Project records were organized around the assignment. The documentation highlighted that the trip history and current station snapshot come from different periods.

### November 4, 2026 — The project pauses before choosing its business problem

Riley considered a question about underused docking hardware, then decided not to lock in a business problem or KPI before understanding the data. The agreed sequence became descriptive exploration first, followed by choosing a problem based on evidence.

### November 4, 2026 — Agent guidance and human audits become part of the workflow

Riley shaped `AGENTS.md` around explicit approval, concise consulting, project-lead control, and preserving project context in the repo. The audit protocol and log were organized to record meaningful human checks, with evidence and limitations stated clearly.

### November 4, 2026 — The charter and findings file become flexible frameworks

The charter and findings structure were adjusted to support a future business problem without presuming its question, KPI, benchmark, or recommendation. The repo was prepared for descriptive findings before CP1 gap analysis.

### November 5, 2026 — The first monthly trip overview is reviewed

Riley supplied a monthly trip-count result from BigQuery. Its counts reconcile to the totals reported in the dataset documentation. The result contains no monthly rows from October 2016 through March 2017 and reports 5,828,994 rows with missing `starttime`. These were supplied results; the agent did not run the query.

### November 5, 2026 — Data-quality checks confirm blank rows and station snapshot limits

Riley supplied results for Queries 02–04. Query 02 confirmed that rows with missing `starttime` also have null `stoptime`, `tripduration`, station IDs, and `bikeid`. Query 03 confirmed that `usertype` is an empty string for all 5,828,994 blank rows. Query 04 confirmed that `citibike_stations` is a modern snapshot (953 stations, 72% active), not a historical table matching the 2013–2018 trip data.

### November 5, 2026 — Descriptive exploration establishes baselines

Riley ran Queries 05–12 in BigQuery and supplied the results, which were documented in [sql/README.md](sql/README.md) and synthesized in [findings.md](findings.md): annual Subscriber share rose from about 78% in 2013 to 87% by 2018; Subscriber trips were shorter than Customer trips; Subscriber trips peaked on weekdays and Customer trips on weekends; Customer routes concentrated around park loops and waterfronts; demographic reporting was almost entirely by Subscribers; weekday commute hours had strong peaks; and station departures concentrated at major transit hubs.

### November 5, 2026 — Project stages defined and Cleaning Rule C1 approved

Riley added the seven-stage roadmap recorded above and approved C1: exclude rows where `starttime IS NULL`. The rule removes 5,828,994 non-trip rows, leaving 53,108,721 validated trips.

### November 5, 2026 — Cleaning Rule C2 and the business question approved

The project selected trips over 24 hours (`tripduration > 86400`) in June 2017–May 2018, comparing Customers with Subscribers. See [decisions.md](decisions.md) and [charter.md](charter.md) for the approved framing and rules.

### November 5, 2026 — Gap and benchmark checked

Riley ran Query 16 and supplied its two-row result. It confirmed 15.98 vs. 1.05 trips over 24 hours per 10,000 valid trips and 20,736.7 excess bike-days; the check is recorded as audit #9.

### November 5, 2026 — Valuation approach selected

Riley checked the May 2018 Citi Bike Monthly Operating Report figures and selected Option C, a casual-pass to system-wide ride-fee value range. The valuation is recorded as a ceiling, not realized savings; see rule V1 and audit #8.

### November 9, 2026 — CP1 value and charts completed

The Option C annual ceiling range (~$55.6K–$335.2K) and primary comparison and supplementary monthly trend charts were recorded in [findings.md](findings.md). Riley checked chart values against Queries 14 and 16 (audit #10) and reports that the completed `riley-setup` work was merged into `main` on GitHub.

### November 10, 2026 — Git instruction error recorded

Riley identified that the agent had committed and pushed project changes directly to `main`, contrary to the repo's Git instructions. The error and the agent's response are recorded in audit #11. Three commits had already been pushed to `main` and were left in place.

## Resuming work

Read the repo, then follow Riley's latest direction. Propose one small next action relevant to that direction. Under the standing authorization in [AGENTS.md](AGENTS.md), before returning from authorized work, record material progress or milestones even if the overall stage is unchanged; update current status and next steps when they change. If nothing material happened, do not add a filler entry. Keep approved choices in [decisions.md](decisions.md), analysis in [findings.md](findings.md) and the SQL records, and human checks in [Other/audit_log.md](Other/audit_log.md).

The instructor grades `main`. Riley runs Git commands manually and merges `riley-setup` into `main` on GitHub.
