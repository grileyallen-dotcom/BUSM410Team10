# CP2 Model Card: Over-24-Hour Citi Bike Trips

*Updated 2026-11-19. Model trained in BigQuery ML on `busm410-project.citibike_cp2.cp2_trip_analysis` (`16,951,030` valid trips, June 2017–May 2018).*

## Model setup and X variable choices

- **Target (`Y`):** `is_over_24h` (`1` if `tripduration > 86400`, else `0`; binary yes/no → `LOGISTIC_REG`, [23_train_logistic_model.sql](../sql/23_train_logistic_model.sql)).
- **Unit & split:** One row per valid CP1 trip (`16,951,030` rows — well above 500, so BigQuery automatically held out a test split for `ML.EVALUATE`). Count-your-`Y` ([20_analysis_table_checks.sql](../sql/20_analysis_table_checks.sql)): `16,946,556` rows are `0` (`99.974%`) and `4,474` rows are `1` (`0.026%`).
- **Included pre-outcome `X`s (6):** `usertype`, `gender`, `day_type`, `time_of_day`, `season`, `start_area`.
- **Excluded CP1 fields (and why):**
  - `birth_year`: ~91% null among `unknown`-gender trips (mostly casual Customers) plus implausible `<1900` entries (CP1 Finding 9).
  - Raw `start_station_name` (~800 stations): replaced by geographic `start_area` to avoid ~800 dummy variables and complete separation when computing p-values.
  - `stoptime`, `end_station_*`, `tripduration`: post-outcome fields excluded to prevent target leakage.
  - `citibike_stations` attributes: 2026 live snapshot, incompatible with 2017–2018 historical trips (CP1 Finding 3).

## Report card

Source: [24_model_evaluate.sql](../sql/24_model_evaluate.sql) (`ML.EVALUATE`) and [20_analysis_table_checks.sql](../sql/20_analysis_table_checks.sql) (count-your-`Y` baseline).

| Measure | Your number | What it means |
|---|---:|---|
| accuracy | 0.99970 | Share of test rows the model got right |
| baseline | 0.99974 | Share right if you always guess the most common answer (`0`, 16,946,556 / 16,951,030) |
| roc_auc | 0.8109 | 0.5 = no better than chance. Closer to 1.0 = better |

Our model does not beat the baseline (0.99970 vs. 0.99974), and its roc_auc of 0.8109 is close to 1.0, so it is not ready to predict for a business decision.

**Honest reading & what the model may be missing:** Because >24-hour trips occur on only `0.026%` of rides, the default 0.50 cutoff predicts `0` for every test trip (`precision = 0.0`, `recall = 0.0`, `f1_score = 0.0`, `log_loss = 0.00213`). However, `roc_auc = 0.8109` shows strong relative-risk ranking across trips, and the model is valid for **inference** below. Part A suggests the public dataset is missing key operational factors that likely drive remaining risk: specific casual pass type (Single Ride vs. 24-hour/3-day pass), dock-locking malfunctions or full-dock return failures, first-time rider experience, and daily weather.

## Drivers (`ML.ADVANCED_WEIGHTS`)

Source: [25_model_advanced_weights.sql](../sql/25_model_advanced_weights.sql). Skips `__INTERCEPT__` (`-8.0926`) and the `0.0 / NaN` reference category for each `X`: `Subscriber` (`usertype`), `male` (`gender`), `Weekday` (`day_type`), `Afternoon_12_17` (`time_of_day`), `Summer` (`season`), and `Manhattan` (`start_area`). P-values printed as `0.0` or `< 0.0001` are written as `<0.0001`.

| X | Coefficient | p-value | Reading |
|---|---:|---:|---|
| `usertype`: Customer (vs. Subscriber) | +3.0049 | <0.0001 | Real link, pushes >24h sharply up |
| `start_area`: Central_East_Brooklyn (vs. Manhattan) | +2.9642 | <0.0001 | Real link, pushes >24h sharply up |
| `start_area`: Other_NJ (vs. Manhattan) | +1.0148 | 0.0227 | Real link, pushes >24h up (small sample: 3,525 trips) |
| `start_area`: West_North_Brooklyn (vs. Manhattan) | +0.9379 | <0.0001 | Real link, pushes >24h up |
| `start_area`: Queens (vs. Manhattan) | +0.8710 | <0.0001 | Real link, pushes >24h up |
| `start_area`: Unknown (vs. Manhattan) | -14.1989 | 0.9985 | Could be chance (only 190 trips / 2 >24h; separation in training split) |
| `time_of_day`: Overnight_22_05 (vs. Afternoon_12_17) | -0.1837 | 0.0005 | Real link, pushes >24h down |
| `gender`: female (vs. male) | -0.3796 | <0.0001 | Real link, pushes >24h down |
| `time_of_day`: Evening_18_21 (vs. Afternoon_12_17) | -0.4095 | <0.0001 | Real link, pushes >24h down |
| `day_type`: Weekend (vs. Weekday) | -0.4098 | <0.0001 | Real link, pushes >24h down |
| `season`: Fall (vs. Summer) | -0.7214 | <0.0001 | Real link, pushes >24h down |
| `season`: Spring (vs. Summer) | -0.8282 | <0.0001 | Real link, pushes >24h down |
| `season`: Winter (vs. Summer) | -0.9813 | <0.0001 | Real link, pushes >24h down |
| `gender`: unknown (vs. male) | -1.5256 | <0.0001 | Real link, pushes >24h sharply down |
| `time_of_day`: Morning_06_11 (vs. Afternoon_12_17) | -1.5978 | <0.0001 | Real link, pushes >24h sharply down |

### Two strongest drivers

- `usertype = Customer`'s coefficient is positive (`+3.0049`), with a p-value below 0.0001, so holding the other X's steady, being a casual Customer goes with a higher chance of keeping a bike out over 24 hours.
- `start_area = Central_East_Brooklyn`'s coefficient is positive (`+2.9642`), with a p-value below 0.0001, so holding the other X's steady, starting a trip in Central/East Brooklyn goes with a higher chance of keeping a bike out over 24 hours.

A real link does not prove that X causes Y. Notably, holding other `X`s steady reversed three Part A patterns: `Weekend`, `gender = unknown`, and `Overnight_22_05` all looked higher when viewed alone, but flipped negative once `usertype` and `start_area` were held steady.
