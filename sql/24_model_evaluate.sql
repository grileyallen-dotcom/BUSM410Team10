-- Step 24: Evaluate CP2 logistic regression model on held-out test rows (CP2 Part B report card). See sql/README.md for notes.
-- Count-your-Y baseline was confirmed in Query 20 (sql/20_analysis_table_checks.sql): 16,946,556 rows = 0 (99.974%) and 4,474 rows = 1 (0.026%) out of 16,951,030 total rows.
SELECT *
FROM ML.EVALUATE(MODEL `busm410-project.citibike_cp2.cp2_over_24h_logit`);
