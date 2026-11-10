-- Step 7: Compare trip duration percentiles, averages, and >24h outliers by usertype. See sql/notes.md for notes.
SELECT
  usertype,
  COUNT(*) AS total_trips,
  ROUND(AVG(tripduration) / 60.0, 1) AS avg_duration_min,
  ROUND(APPROX_QUANTILES(tripduration, 100)[OFFSET(25)] / 60.0, 1) AS p25_duration_min,
  ROUND(APPROX_QUANTILES(tripduration, 100)[OFFSET(50)] / 60.0, 1) AS median_duration_min,
  ROUND(APPROX_QUANTILES(tripduration, 100)[OFFSET(75)] / 60.0, 1) AS p75_duration_min,
  ROUND(APPROX_QUANTILES(tripduration, 100)[OFFSET(99)] / 60.0, 1) AS p99_duration_min,
  COUNTIF(tripduration > 86400) AS trips_over_24h,
  ROUND(COUNTIF(tripduration > 86400) * 100.0 / COUNT(*), 4) AS pct_over_24h
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE
  starttime IS NOT NULL
GROUP BY
  usertype
ORDER BY
  total_trips DESC;
