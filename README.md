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

## Approved problem framing

During June 2017–May 2018, trips over 24 hours occurred at a rate of 15.98 per 10,000 valid Customer trips, compared with 1.05 for Subscribers (15.2×). At the Subscriber benchmark rate, Customer trips correspond to 20,736.7 excess bike-days in the period. The approved value estimate is a ~$55.6K–$335.2K annual ride-fee capacity ceiling, not realized savings.

This analysis supports an operations manager’s decision about targeted return reminders or station messaging. The [charter](charter.md) defines the approved question and scope, [findings](findings.md) presents the calculations and charts, and the [SQL guide](sql/README.md) documents methods and results.


