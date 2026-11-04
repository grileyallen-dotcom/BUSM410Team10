# Team10

**Course:** BUSM 410 · Big Data and Advanced Analytics · BYU–Hawaii  
**Canvas team:** Team 10

## Team

- Riley Allen — project lead
- Rainy Villame — project partner

The AI agent serves as a consultant: it explains evidence, challenges assumptions, presents options, and recommends next steps. Riley directs the project and approves actions and conclusions.

## Current stage

See [progress](progress.md) for the current stage and [decisions](decisions.md) for the latest project-lead direction. Riley determines when to move between organization, exploration, and problem-focused analysis. Stage records provide context and can be changed by Riley's explicit direction.

## Project setup

- **Dataset:** Citi NY Bikes
- **Google Cloud project ID:** `busm410-project`

## BigQuery access

The screenshot below shows the project IAM setup with our partner and instructor added.

<img width="1512" height="982" alt="BigQuery IAM page showing project access" src="https://github.com/user-attachments/assets/8afd644b-be6b-4b00-8092-31f59899099d" />

## Repository guide

- [charter.md](charter.md) — analysis question, scope, and success criteria
- [findings.md](findings.md) — descriptive context and, later, findings for the selected business problem
- [AGENTS.md](AGENTS.md) — project lead and consultant roles, approvals, and working instructions
- [Dataset documentation](Other/metadata.pdf) — supplied dataset overview and table descriptions
- [Table diagram](Other/ERD.pdf) — supplied ERD and proposed station crosswalk
- [Documentation notes](Other/dataset_documentation.md) — schema transcription, source status, and verification limits
- [CLAUDE.md](CLAUDE.md) — directs Claude to the shared instructions
- [decisions.md](decisions.md) — project-lead direction, approved choices, and open questions
- [progress.md](progress.md) — current stage and resuming work
- [Other/audit_protocol.md](Other/audit_protocol.md) and [Other/audit_log.md](Other/audit_log.md) — team review process and approved human checks
- [.agents/skills/project-audit/SKILL.md](.agents/skills/project-audit/SKILL.md) — audit record workflow
- [sql/](sql/) — BigQuery queries and [query guide](sql/README.md)
- [model/](model/) — optional modeling notes and results
- [visuals/](visuals/) — charts and visual notes

## Assignment approach

Describe the dataset and its setting first. After reviewing that evidence, the project lead will select the future business problem and approve its question, KPI, benchmark, and scope. Analyze in SQL when requested; Excel or Looker may be used for visuals. Later, complete CP1's measured gap, sourced value calculation, and chart. Keep conclusions tied to evidence and explain limitations.


