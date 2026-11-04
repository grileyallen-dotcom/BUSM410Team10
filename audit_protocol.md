# Audit Protocol

## Purpose

Learn to direct and evaluate AI-assisted analysis. Students explain and own analytical judgments. The agent helps with examples, implementation, and challenges to the reasoning.

## Small analysis cycle

Use this cycle for one useful analytical question at a time. Keep it proportionate: pause at meaningful choices, not every line or routine file edit. Reuse reasoning the student already supplied.

1. **Frame the question.** The student explains the business question, why it matters, and their initial approach. The agent offers hints or a worked example when needed. Agree on the next small step.
2. **Predict and define the output.** Before running SQL, the student describes what one row represents, the needed columns and units, the expected pattern, and a surprising result. A qualitative prediction is enough.
3. **Review the query and cost.** The agent explains the SQL in small pieces. The student explains key calculations, joins, filters, and denominators in their own words. Confirm table/schema evidence and review the BigQuery editor's estimated scan before accepting execution. Record the estimate in [SQL notes](sql/notes.md).
4. **Run the accepted query.** The student runs it by default; agent execution follows AGENTS.md. Preserve the query/result relationship and distinguish prepared, executed, and independently verified work. A saved query or uploaded CSV alone proves neither execution details nor correctness.
5. **Interpret before receiving the agent's answer.** The student explains what the result shows, how it compares with their prediction, and possible explanations. The agent then checks the reasoning, raises alternatives, and identifies uncertainty.
6. **Verify a consequential claim.** The student checks an important assumption, source, calculation, or interpretation using evidence beyond simply accepting the agent's answer. The agent may guide the check and report its own checks separately. Use the checks below.
7. **Decide and record.** The student chooses the next step and explains why. Record consequential choices in [decisions.md](decisions.md). When an actual human check is substantial enough to log, the agent proposes an audit entry for approval.

## Checks to use

- **Source and schema:** Check the source, date coverage, fields, units, and definitions. A preview establishes only what it displays; check broader data before making whole-table claims.
- **Query and calculation:** Compare logic with the KPI definition. Work through a small example or recalculate a key result; inspect join duplicates, missing matches, excluded records, and denominators.
- **Interpretation:** Separate measured results, explanations, and recommendations. Ask whether another explanation fits the same result and what evidence could distinguish them.
- **Model:** Before modeling, explain the question, inputs, evaluation, leakage risks, and simple comparison. Explain how the result could change a decision.
- **Recommendation:** Before the agent drafts a final recommendation, the student explains the evidence, assumptions, alternatives, proposed action, uncertainty, and what would change their mind. Further evidence may be the appropriate next action.

For station dock turnover, useful checks include historical capacity, station-name join coverage/uniqueness, zero-trip days and operating dates, and whether a median benchmark supports any proposed action. These are examples to evaluate, not completed checks or an agreed KPI choice.

## Records and approval

[decisions.md](decisions.md) records choices and reasons. [audit_log.md](audit_log.md) records actual human checks of the agent. Keep those purposes distinct. An accepted choice or "looks good" does not by itself establish verification.

The agent shows the proposed audit entry and category, and adds it only after team approval. Record who checked what, how, and the result. Do not infer understanding or fabricate a check from an upload, source request, or approval. Follow the [audit skill](.agents/skills/project-audit/SKILL.md) for numbering, counts, evidence limits, and later resolutions.

Propose a short protocol addition when a meaningful review reveals a reusable practice; apply it after team approval.
