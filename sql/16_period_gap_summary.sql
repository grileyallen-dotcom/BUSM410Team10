-- Step 16: Exact Jun 2017–May 2018 gap summary by usertype. See sql/notes.md for notes.
SELECT
  usertype,
  COUNT(*) AS valid_trips,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS pct_of_valid_trips,
  COUNTIF(tripduration > 86400) AS trips_over_24h,
  ROUND(COUNTIF(tripduration > 86400) * 10000.0 / COUNT(*), 2) AS over_24h_per_10k_trips,
  ROUND(SUM(IF(tripduration > 86400, tripduration, 0)) / 86400.0, 1) AS over_24h_bike_days
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE
  starttime >= DATETIME '2017-06-01'
  AND starttime < DATETIME '2018-06-01'
GROUP BY
  usertype
ORDER BY
  usertype;
