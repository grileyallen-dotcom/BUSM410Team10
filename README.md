# Team10

**Course:** BUSM 410 · Big Data and Advanced Analytics · BYU–Hawaii  
**Canvas team:** Team 10

## Team

- Riley Allen
- Rainy Villame

## Project setup

- **Dataset:** Citi NY Bikes
- **Google Cloud project ID:** `busm410-project`

## BigQuery access

The screenshot below shows the project IAM setup with our partner and instructor added.

<img width="1512" height="982" alt="BigQuery IAM page showing project access" src="https://github.com/user-attachments/assets/8afd644b-be6b-4b00-8092-31f59899099d" />

## Repository guide

- [charter.md](charter.md) — analysis question, scope, and success criteria
- [findings.md](findings.md) — supported KPI benchmark, trends, chart, and recommendation
- [AGENTS.md](AGENTS.md) — learning agreement, project onboarding, and AI working instructions
- [CLAUDE.md](CLAUDE.md) — directs Claude to the shared instructions
- [decisions.md](decisions.md) — important choices, student reasoning, alternatives, and open questions
- [audit_protocol.md](audit_protocol.md) and [audit_log.md](audit_log.md) — team review process and approved human checks
- [.agents/skills/project-audit/SKILL.md](.agents/skills/project-audit/SKILL.md) — audit record workflow
- [sql/](sql/) — BigQuery queries and [query notes](sql/notes.md)
- [model/](model/) — optional modeling notes and results
- [visuals/](visuals/) — charts and visual notes

## Assignment approach

Research bike-share KPIs, compare measures that the available data can support, then select one KPI and one business problem with the team. Analyze in SQL. Excel or Looker may be used for visuals. Keep conclusions tied to evidence and explain limitations.

## Learning with the agent

Before important analytical choices, explain your initial thinking. Predict what a query will show, review its logic and estimated scan, and interpret the result before receiving the agent's explanation. Ask for hints or a worked example when needed. Verify consequential claims and explain the evidence and uncertainty before making a recommendation. The agent can handle authorized routine work; the team owns analytical decisions and merges.

Follow the small cycle in [audit_protocol.md](audit_protocol.md). Record consequential choices in [decisions.md](decisions.md) and actual human checks of agent work in [audit_log.md](audit_log.md).

## Saved analysis — November 3, 2026

- [Current findings](findings.md) and [progress / next action](progress.md)
- [Ten-KPI scorecard](analysis/kpi_scorecard.md)
- [Time comparisons and duration investigation](analysis/time_series_investigation.md)
- [Original exported evidence](evidence/README.md)
- [Saved queries and execution notes](sql/notes.md)

The leading candidate finding concerns Customer records exceeding 24 hours in May 2018. The timestamp check remains a draft, and team KPI/problem selection, charting and an operating recommendation remain open.

The imported [Antigravity Stage 1 handoff](analysis/antigravity_stage_1_handoff.md) reports a separate station dock turnover focus. The team still needs to reconcile these directions; see the [open analytical choice](decisions.md#open-analytical-choice).
