-- Step 17: Over-24h trip rate by day of week and usertype, Jun 2017–May 2018. Run by Norainelle Diaz 2026-11-10.
-- Output row: day_of_week × usertype (14 rows). Same filters and KPI as Query 16.
-- Check: Customer day counts sum to 2,883 and Subscriber to 1,591, matching Query 16.
SELECT
  FORMAT_DATETIME('%u_%A', starttime) AS day_of_week,
  usertype,
  COUNT(*) AS valid_trips,
  COUNTIF(tripduration > 86400) AS trips_over_24h,
  ROUND(COUNTIF(tripduration > 86400) * 10000.0 / COUNT(*), 2) AS over_24h_per_10k_trips
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE
  starttime >= DATETIME '2017-06-01'
  AND starttime < DATETIME '2018-06-01'
GROUP BY
  day_of_week, usertype
ORDER BY
  usertype, day_of_week;
