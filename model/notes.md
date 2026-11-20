# Model Notes

*Updated 2026-11-19 for CP2.*

See [model_card.md](model_card.md) for the full CP2 report card, required verdict, `ML.ADVANCED_WEIGHTS` table, and two strongest drivers.

## Model question

Holding other trip-start characteristics steady, which pre-outcome factors (`usertype`, `gender`, `day_type`, `time_of_day`, `season`, `start_area`) are most strongly associated with a Citi Bike trip exceeding 24 hours (`is_over_24h = 1`) during June 2017–May 2018?

## Method, data, and evaluation

- **Analysis table:** `busm410-project.citibike_cp2.cp2_trip_analysis` (`16,951,030` rows, 1 row per valid CP1 trip; [19_build_analysis_table.sql](../sql/19_build_analysis_table.sql)), verified with all five checks and Query 16 reconciliation ([20_analysis_table_checks.sql](../sql/20_analysis_table_checks.sql)).
- **Model:** BigQuery ML `LOGISTIC_REG` (`busm410-project.citibike_cp2.cp2_over_24h_logit`, [23_train_logistic_model.sql](../sql/23_train_logistic_model.sql)) using `calculate_p_values = TRUE`, `category_encoding_method = 'DUMMY_ENCODING'`, `max_iterations = 50`, and `early_stop = FALSE`.
- **Evaluation:** Held-out `ML.EVALUATE` ([24_model_evaluate.sql](../sql/24_model_evaluate.sql)) gives `accuracy = 0.99970` vs. null baseline `0.99974` (`roc_auc = 0.8109`), and `ML.ADVANCED_WEIGHTS` ([25_model_advanced_weights.sql](../sql/25_model_advanced_weights.sql)) identifies `usertype = Customer` (`+3.0049`, `p < 0.0001`) and `start_area = Central_East_Brooklyn` (`+2.9642`, `p < 0.0001`) as the two strongest drivers.

## Results and decision

The model is used for **inference** (not individual trip-level binary prediction at the 0.50 cutoff) and directs operational focus toward casual `Customer` trips starting in Central and East Brooklyn. Statistical associations do not establish causation; see [model_card.md](model_card.md), [findings.md](../findings.md), and [charter.md](../charter.md) for details and limits.
