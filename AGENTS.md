# AGENTS.md

Read this first. This is the BUSM 410 Team 10 bike-share analysis, using BigQuery SQL and an AI agent.

## Project aim
Research the standard KPIs used by bike-share and ride-share companies. Compare the available Citi Bike data with accepted KPI definitions and relevant market benchmarks. Select one KPI and one clear business problem with the team, show the problem with a chart, investigate the variables associated with it, and consider whether clustering or regression can help identify an action.

The analysis question, selected KPI, benchmark source, and recommended action are not yet confirmed. Do not invent them or present a draft as an agreed decision.

## File index
| File | Use it when |
|---|---|
| [Project audit skill](.agents/skills/project-audit/SKILL.md) | Starting a session or recording a meaningful human check |
| [Audit protocol](audit_protocol.md) | Following or proposing changes to the team's review process |
| [Audit log](audit_log.md) | Reviewing or proposing a record of a human check |
| [Findings](findings.md) | Presenting supported results, charts, and limits |
| [Charter](charter.md) | Checking the project question and scope |
| [SQL notes](sql/notes.md) | Recording each query's purpose, cost, results, and decision |
| [Model notes](model/notes.md) | Recording an approved model question, method, and evaluation |

## Working with the team
- Keep replies short and use plain wording. Explain context before feedback and teach terms when the team is unsure.
- Take one small step at a time. Questions get answers, not actions. Make changes when the team clearly asks.
- Show SQL in small pieces and explain each line before the team accepts it. Save approved queries in their designated place.
- Query only the columns needed. Confirm the actual table, fields, definitions, and date coverage before relying on them.
- Keep claims traceable to a source, query, or workbook. Mark inferences as inferences.
- Treat observed relationships as associations. Do not call them causes unless the study design supports that conclusion.
- Use SQL only. Do not add Python files or Python setup. Visuals may be prepared in Excel or Looker.
- Keep findings grounded in verified project evidence. Never copy the instructor example's Medicare data, results, or assumptions into this project.

## Analysis workflow
1. Review the dataset schema and coverage.
2. Research standard bike-share or ride-share KPIs and document authoritative sources and calculation definitions.
3. Compare feasible KPIs with the available data and identify potential self-benchmarks over time or a suitable competitor benchmark.
4. Present candidate KPI and problem choices to the team. Focus on one KPI and one business problem after the team agrees.
5. Draft and review small SQL queries. Save approved, useful queries in sql/ with clear names and notes in sql/notes.md.
6. Chart the selected KPI so the business problem is visible.
7. Investigate possible drivers. Consider clustering or regression only if a clear question, usable fields, and evaluation method exist.
8. Recommend an action only when the evidence supports it. Explain uncertainty and limits.

## Version control
The team reviews and merges the GitHub branch. Clearly label AI-assisted changes in commit or pull-request descriptions. Do not merge a branch or claim that unverified work was checked by the team.

## Audit records
Propose meaningful human checks for audit_log.md and add them only after team approval. Follow the project-audit skill and preserve the distinction between the agent's work and the team's check.
