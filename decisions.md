# Decisions

Keep a short record of consequential choices and the student's stated reasons. This helps the team explain and defend its analysis. Actual human checks of agent work belong in [audit_log.md](audit_log.md).

## How to use this record

- Record choices that affect the business question, KPI, benchmark, denominator, material filters/joins, model, or recommendation. Skip routine formatting and file operations.
- Use the student's own explanation, or a faithful summary they confirm. Identify the actual decision-maker; Riley's request does not establish another team member's agreement.
- Label a proposal **Proposed** until the decision-maker accepts it. Record the actual acceptance date and who accepted it. Do not turn silence into acceptance.
- Accepted analytical decisions guide updates to the charter, findings, and progress when those edits are authorized. If documents conflict and no accepted decision resolves them, ask the team before dependent analysis.
- Retain earlier decisions. A later dated decision can supersede an earlier one by ID and explain why.

## D001 — Learning workflow

- **Status:** Accepted by Riley Allen on November 3, 2026.
- **Choice:** Use student reasoning at important analytical decisions, predictions before SQL execution, student interpretation before the agent's interpretation, actual human verification, and a student explanation before final recommendations.
- **Reason stated by Riley:** Learn to use artificial intelligence as an agent in data analysis and recommendations, and avoid mindlessly using AI to arrive at a final solution.
- **Alternative considered:** Rely primarily on approving AI-generated work. Riley requested implementation of the learning workflow after the agent described these alternatives.
- **Basis:** Riley's goal and explicit "Implement these changes" instruction in the project setup conversation on November 3, 2026.
- **Limits/open questions:** This accepts a working process. It records no analytical validation, KPI selection, or audit check.

## Open analytical choice

The existing [charter](charter.md), [findings](findings.md), and [progress](progress.md) leave the final KPI/problem open. The imported [Antigravity handoff](analysis/antigravity_stage_1_handoff.md) reports a station dock turnover focus and Stage 1 completion, with validation needs.

At the next analytical decision, ask the team which direction to adopt and why. Record the choice and its evidence before dependent analysis. Neither path is accepted by this workflow change.

## Format for the next consequential decision

Use the next unused D number and record:

- **Decision/question and status:** Proposed, Accepted, or Superseded; actual dates and decision-maker.
- **Student's reasoning:** Their explanation of why this choice fits the business question.
- **Alternatives:** Plausible options and why they were set aside.
- **Evidence and assumptions:** Links to sources, queries/results, or workbook calculations; distinguish facts and assumptions.
- **Uncertainty:** Open questions and evidence that could change the decision.
- **Next action:** The agreed step and any earlier decision this supersedes.

The agent may draft a proposed record, but must leave missing reasoning open and request the student's explanation.
