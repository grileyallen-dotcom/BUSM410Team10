-- Dataset: bigquery-public-data.new_york_citibike
-- Table: citibike_trips
-- Investigate recorded Customer trip durations in May 2017 versus May 2018.
-- Reads starttime, usertype and tripduration. Check estimated bytes first;
-- a date filter does not guarantee fewer bytes on an unpartitioned table.
-- Retain long rides: these buckets are exploratory, not validity rules.
WITH selected AS (
  SELECT
    DATE_TRUNC(DATE(starttime), MONTH) AS month,
    tripduration,
    CASE
      WHEN tripduration <= 1800 THEN 1
      WHEN tripduration <= 3600 THEN 2
      WHEN tripduration <= 10800 THEN 3
      WHEN tripduration <= 21600 THEN 4
      WHEN tripduration <= 86400 THEN 5
      ELSE 6
    END AS band_order
  FROM `bigquery-public-data.new_york_citibike.citibike_trips`
  WHERE LOWER(TRIM(usertype)) = 'customer'
    AND tripduration > 0
    AND (
      (starttime >= DATETIME '2017-05-01 00:00:00'
       AND starttime < DATETIME '2017-06-01 00:00:00')
      OR
      (starttime >= DATETIME '2018-05-01 00:00:00'
       AND starttime < DATETIME '2018-06-01 00:00:00')
    )
), grouped AS (
  SELECT
    month,
    band_order,
    COUNT(*) AS trips,
    SUM(tripduration) AS total_seconds,
    AVG(tripduration) / 60.0 AS mean_minutes,
    MAX(tripduration) / 3600.0 AS maximum_hours
  FROM selected
  GROUP BY month, band_order
)
SELECT
  month,
  CASE band_order
    WHEN 1 THEN 'Up to 30 minutes'
    WHEN 2 THEN 'Over 30 to 60 minutes'
    WHEN 3 THEN 'Over 1 to 3 hours'
    WHEN 4 THEN 'Over 3 to 6 hours'
    WHEN 5 THEN 'Over 6 to 24 hours'
    WHEN 6 THEN 'Over 24 hours'
  END AS duration_band,
  trips,
  ROUND(mean_minutes, 2) AS mean_minutes,
  ROUND(maximum_hours, 2) AS maximum_hours,
  total_seconds / 60.0 AS recorded_trip_minutes,
  ROUND(100 * SAFE_DIVIDE(trips, SUM(trips) OVER (PARTITION BY month)), 3)
    AS customer_trip_percent,
  ROUND(100 * SAFE_DIVIDE(total_seconds,
    SUM(total_seconds) OVER (PARTITION BY month)), 3)
    AS customer_duration_percent
FROM grouped
ORDER BY month, band_order;
