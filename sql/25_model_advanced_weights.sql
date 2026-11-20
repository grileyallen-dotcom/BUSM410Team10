-- Step 25: Extract coefficients and p-values from CP2 logistic regression model (CP2 Part B drivers). See sql/README.md for notes.
SELECT *
FROM ML.ADVANCED_WEIGHTS(MODEL `busm410-project.citibike_cp2.cp2_over_24h_logit`);
