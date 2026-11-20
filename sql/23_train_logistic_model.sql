-- Step 23: Train CP2 Part B logistic regression model predicting is_over_24h from all 6 pre-outcome X variables. See sql/README.md for notes.
CREATE OR REPLACE MODEL `busm410-project.citibike_cp2.cp2_over_24h_logit`
OPTIONS (
  model_type = 'logistic_reg',
  input_label_cols = ['is_over_24h'],
  calculate_p_values = TRUE,
  category_encoding_method = 'DUMMY_ENCODING',
  max_iterations = 50,
  early_stop = FALSE
) AS
SELECT
  is_over_24h,
  usertype,
  gender,
  day_type,
  time_of_day,
  season,
  start_area
FROM `busm410-project.citibike_cp2.cp2_trip_analysis`;
