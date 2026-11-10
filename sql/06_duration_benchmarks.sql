-- Step 6: Descriptive benchmarks and outlier checks for tripduration. See sql/notes.md for notes.
SELECT
  COUNT(*) AS total_valid_trips,
  MIN(tripduration) AS min_duration_sec,
  ROUND(AVG(tripduration), 1) AS avg_duration_sec,
  ROUND(AVG(tripduration) / 60.0, 1) AS avg_duration_min,
  APPROX_QUANTILES(tripduration, 100)[OFFSET(25)] AS p25_duration_sec,
  APPROX_QUANTILES(tripduration, 100)[OFFSET(50)] AS median_duration_sec,
  APPROX_QUANTILES(tripduration, 100)[OFFSET(75)] AS p75_duration_sec,
  APPROX_QUANTILES(tripduration, 100)[OFFSET(99)] AS p99_duration_sec,
  MAX(tripduration) AS max_duration_sec,
  COUNTIF(tripduration <= 0) AS non_positive_durations,
  COUNTIF(tripduration > 86400) AS trips_over_24h
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE
  starttime IS NOT NULL;
