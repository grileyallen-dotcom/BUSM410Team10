-- Step 14: Monthly >24h lockup rate and bike-days tied up by usertype. See sql/notes.md for notes.
SELECT
  FORMAT_DATETIME('%Y-%m', starttime) AS trip_month,
  usertype,
  COUNT(*) AS valid_trips,
  COUNTIF(tripduration > 86400) AS trips_over_24h,
  ROUND(COUNTIF(tripduration > 86400) * 10000.0 / COUNT(*), 2) AS lockups_per_10k_trips,
  ROUND(SUM(IF(tripduration > 86400, tripduration, 0)) / 86400.0, 1) AS over_24h_bike_days
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE
  starttime IS NOT NULL
GROUP BY
  trip_month,
  usertype
ORDER BY
  trip_month,
  usertype;
