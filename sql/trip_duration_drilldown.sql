-- Dataset: bigquery-public-data.new_york_citibike
-- Table: citibike_trips
-- Compare April and May 2017 with April and May 2018 by user type.
-- A date filter reduces scanned bytes only when storage partitioning/clustering
-- allows pruning. Check the editor's estimate; this query was not run locally.
WITH selected AS (
  SELECT
    DATE_TRUNC(DATE(starttime), MONTH) AS month,
    COALESCE(NULLIF(LOWER(TRIM(usertype)), ''), 'unknown') AS user_type,
    tripduration
  FROM `bigquery-public-data.new_york_citibike.citibike_trips`
  WHERE (
    starttime >= DATETIME '2017-04-01 00:00:00'
    AND starttime < DATETIME '2017-06-01 00:00:00'
  ) OR (
    starttime >= DATETIME '2018-04-01 00:00:00'
    AND starttime < DATETIME '2018-06-01 00:00:00'
  )
), metrics AS (
  SELECT
    month,
    user_type,
    COUNT(*) AS total_rows,
    COUNTIF(tripduration IS NULL OR tripduration <= 0) AS invalid_duration_rows,
    COUNTIF(tripduration > 0) AS valid_trips,
    AVG(IF(tripduration > 0, tripduration, NULL)) / 60 AS mean_minutes,
    APPROX_QUANTILES(IF(tripduration > 0, tripduration, NULL), 100)[OFFSET(50)] / 60.0 AS median_minutes,
    APPROX_QUANTILES(IF(tripduration > 0, tripduration, NULL), 100)[OFFSET(95)] / 60.0 AS p95_minutes,
    APPROX_QUANTILES(IF(tripduration > 0, tripduration, NULL), 100)[OFFSET(99)] / 60.0 AS p99_minutes,
    100 * SAFE_DIVIDE(COUNTIF(tripduration > 3600), COUNTIF(tripduration > 0)) AS over_60_minutes_percent,
    AVG(IF(tripduration > 0 AND tripduration <= 3600, tripduration, NULL)) / 60 AS mean_up_to_60_minutes
  FROM selected
  GROUP BY month, user_type
)
SELECT * FROM metrics ORDER BY month, user_type;
