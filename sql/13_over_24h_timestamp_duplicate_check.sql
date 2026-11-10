-- Step 13: Check timestamp agreement and duplicate keys for >24h trips by usertype. See sql/README.md for notes.
SELECT
  usertype,
  COUNT(*) AS valid_trips,
  COUNTIF(tripduration > 86400) AS recorded_over_24h,
  COUNTIF(DATETIME_DIFF(stoptime, starttime, SECOND) > 86400) AS timestamp_over_24h,
  COUNTIF(tripduration > 86400 AND stoptime IS NULL) AS over_24h_missing_stop,
  COUNTIF(tripduration > 86400 AND stoptime < starttime) AS over_24h_negative_diff,
  COUNTIF(
    tripduration > 86400
    AND ABS(tripduration - DATETIME_DIFF(stoptime, starttime, SECOND)) > 60
  ) AS over_24h_mismatch_gt_60s,
  COUNTIF(
    tripduration > 86400
    AND ABS(tripduration - DATETIME_DIFF(stoptime, starttime, SECOND)) > 3660
  ) AS over_24h_mismatch_gt_1h_dst,
  COUNTIF(tripduration > 86400) - COUNT(
    DISTINCT IF(
      tripduration > 86400,
      CONCAT(IFNULL(CAST(bikeid AS STRING), 'NULL'), '|', CAST(starttime AS STRING), '|', IFNULL(CAST(stoptime AS STRING), 'NULL')),
      NULL
    )
  ) AS over_24h_duplicate_bike_times,
  ROUND(SUM(IF(tripduration > 86400, tripduration, 0)) / 86400.0, 1) AS recorded_over_24h_bike_days,
  ROUND(
    SUM(IF(DATETIME_DIFF(stoptime, starttime, SECOND) > 86400, DATETIME_DIFF(stoptime, starttime, SECOND), 0)) / 86400.0,
    1
  ) AS timestamp_over_24h_bike_days
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE
  starttime IS NOT NULL
GROUP BY
  usertype
ORDER BY
  valid_trips DESC;
