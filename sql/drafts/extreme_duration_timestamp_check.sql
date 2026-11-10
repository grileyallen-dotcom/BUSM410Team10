-- DRAFT: Compare recorded and timestamp-derived durations for Customer trips over 24 hours. See sql/README.md for status; not approved or run.
-- Dataset: bigquery-public-data.new_york_citibike
-- Table: citibike_trips
-- Validate May 2017 and May 2018 Customer durations exceeding 24 hours.
-- Reads starttime, stoptime, usertype and tripduration.
-- Check estimated bytes: date predicates do not guarantee storage pruning.
-- Start/stop fields are local DATETIME values per the provided schema.
WITH extreme AS (
  SELECT
    DATE_TRUNC(DATE(starttime), MONTH) AS month,
    starttime,
    stoptime,
    tripduration,
    DATETIME_DIFF(stoptime, starttime, SECOND) AS timestamp_duration_seconds
  FROM `bigquery-public-data.new_york_citibike.citibike_trips`
  WHERE LOWER(TRIM(usertype)) = 'customer'
    AND tripduration > 86400
    AND (
      (starttime >= DATETIME '2017-05-01 00:00:00'
       AND starttime < DATETIME '2017-06-01 00:00:00')
      OR
      (starttime >= DATETIME '2018-05-01 00:00:00'
       AND starttime < DATETIME '2018-06-01 00:00:00')
    )
), classified AS (
  SELECT
    *,
    CASE
      WHEN stoptime IS NULL THEN 'Missing stop time'
      WHEN stoptime < starttime THEN 'Stop precedes start'
      WHEN ABS(tripduration - timestamp_duration_seconds) <= 1
        THEN 'Matches within 1 second'
      ELSE 'Mismatch over 1 second'
    END AS timing_check
  FROM extreme
)
SELECT
  month,
  timing_check,
  COUNT(*) AS records,
  SUM(tripduration) / 60.0 AS recorded_minutes,
  AVG(tripduration) / 86400.0 AS average_recorded_days,
  MAX(tripduration) / 86400.0 AS maximum_recorded_days,
  AVG(timestamp_duration_seconds) / 86400.0 AS average_timestamp_days,
  MAX(ABS(tripduration - timestamp_duration_seconds)) AS maximum_difference_seconds,
  MIN(starttime) AS earliest_start,
  MAX(stoptime) AS latest_stop
FROM classified
GROUP BY month, timing_check
ORDER BY month, timing_check;
