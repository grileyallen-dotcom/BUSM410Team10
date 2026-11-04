# AGENTS.md

Read this before helping with the BUSM 410 Team 10 Citi Bike project. These instructions describe how to work with us.

## Approval and authority

- **Repo changes:** Show the exact proposed change and a brief reason, then wait for explicit approval before modifying the repo. This includes formatting, moving files, updating progress, and changing instructions.
- Approval covers the changes presented. Propose additional changes separately. Questions, brainstorming, suggestions, and discussion do not authorize action.
- **Reading and research:** Reading files, inspecting the repo, and researching external sources never require approval. You may analyze supplied results and suggest actions without changing files.
- **Git actions:** Commits, pushes, creating pull requests, and merges require explicit approval. Approval to edit files does not authorize these actions. State the target branch when requesting approval.
- Preserve existing work. Explain any conflict and ask what to keep before resolving it.
- Apply these approval rules to every project workflow, including the audit skill. Flag conflicting project instructions and follow our latest explicit direction; propose corrections for approval.

## Communication and analysis

- **Replies:** Use simple, plain language and only a few sentences when possible. Provide more detail only when requested.
- Work one small step at a time. Explain unfamiliar terms when needed.
- Analyze results, explain the reasoning, and discuss the interpretation with us. Do not require us to predict results or interpret them before you help.
- Challenge mistaken ideas directly, with evidence and a clear explanation. Revise your own position when the evidence warrants it.
- Distinguish your proposed interpretation from an approved project conclusion. Ask whether we agree before recording it as our conclusion.
- Never invent our reasoning, understanding, decisions, checks, results, or approval.

## Starting a conversation

- Read this file, the [README](README.md), the [audit skill](.agents/skills/project-audit/SKILL.md), the [audit protocol](Other/audit_protocol.md), and the [audit log](Other/audit_log.md).
- Read the [decisions](decisions.md), [progress](progress.md), [charter](charter.md), [findings](findings.md), and relevant saved work for context. Inspect the current branch and local changes when accessible.
- The repo holds the information needed for future conversations. Treat missing or conflicting information as unresolved; ask when it is needed rather than filling gaps with assumptions.
- After reading, wait for our direction. Do not automatically synchronize branches, change files, run queries, or advance the project.

## SQL and cost estimates

- Prepare one short, understandable query at a time. Explain its purpose, what one output row represents, the columns used, and important filters or assumptions.
- Ask us to confirm the tables and columns exist before using them in an analytical query. Use documentation and supplied schema evidence to support that confirmation.
- Provide an estimated scan and cost with the source and pricing assumptions. Use BigQuery's estimate when available; label calculations and distinguish estimated cost from actual charges.
- If a reliable estimate is unavailable, say so and request the estimate shown by the BigQuery editor. Never invent a cost or treat an unknown cost as zero.
- We run the BigQuery queries. Prepare queries for us; do not execute them yourself.
- Select only needed columns. LIMIT does not normally reduce scanned bytes.
- With approval, save accepted queries as numbered files such as `sql/01_exploration.sql`. Begin each with a short `--` note pointing to `sql/README.md`; keep explanations, estimates, results, and cleaning choices there.
- Check relevant fields for missing values, duplicates, impossible values, date-boundary effects, and unequal observation periods before drawing conclusions. Propose material cleaning choices for our approval.
- Use SQL for analysis. Do not add Python files or Python setup. Excel or Looker may be used for visuals; keep CSV and Excel data files out of the repo.

## Evidence and project memory

- Support factual claims with a source: documentation and page or section, query and result, or a clearly identified research source. Label assumptions, calculations, and interpretations.
- Treat observational relationships as associations unless the design supports causation. A benchmark-based value calculation does not establish recoverable demand or guaranteed savings.
- Propose updates to decisions and progress when useful, and wait for approval before saving them. Separate approved decisions from proposals and unresolved questions.
- Read the audit skill when reviewing human checks. The [audit protocol](Other/audit_protocol.md) describes the process; the [audit log](Other/audit_log.md) records real human checks of agent work.
- Propose each audit entry or protocol addition before saving it. Routine approvals and the agent's own checks do not count as human audits.
- Use the instructor example for structure and process. Build this project's conclusions from our Citi Bike evidence.

## Project facts and verification status

- **Canvas team:** Team 10. **Partners:** Riley Allen and Rainy Villame. A separate fun team name is not yet recorded. Source: [README](README.md).
- **Dataset name recorded by the team:** Citi NY Bikes. **Google Cloud project ID recorded by the team:** `busm410-project`. Source: [README](README.md).
- **Dataset path proposed in an existing draft:** `bigquery-public-data.new_york_citibike`. Its use in the current analysis still needs confirmation. Source: [saved draft](sql/drafts/extreme_duration_timestamp_check.sql).
- **Candidate tables:** `citibike_trips` and `citibike_stations`. Schema and preview screenshots are in [schema evidence](evidence/schema_screenshots/); confirm definitions before analytical use.
- **Candidate trip fields:** `starttime`, `stoptime`, `tripduration`, and `usertype` appear in the saved draft. Their definitions, units, coverage, and suitability still need confirmation.
- **Approved cleaning rules, gap, benchmark, and numerical findings:** not yet established in the current project records. Add them with their sources after verification and approval.
- Earlier drafts and imported work are background material. Their presence does not establish execution, verification, or team approval.

## Current assignment

CP1 requires one measured gap, a justified benchmark, a value calculation with sources, and a chart. Explore the documentation and data before proposing the gap.

- `charter.md`: question, manager and decision supported, scope, and three to five success criteria.
- `findings.md`: gap, what one row represents, benchmark and rationale, difference, value calculation, and embedded chart.
- `README.md`: team information table, problem-framing paragraph, and a table linking to the work.
- `sql/`: numbered queries and `sql/README.md` explaining querying and cleaning choices.
- `visuals/`: the gap and benchmark chart.
- `Other/`: dataset documentation or a README documentation link, table diagram, audit protocol, and audit log.

Prepare work on the agreed branch. Keep both partners' contributions attributable to them. Partner review precedes merging finished work into `main`, which the instructor grades. Request explicit approval for every Git action; use GitHub directly when access is available.
