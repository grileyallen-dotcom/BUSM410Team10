-- Step 15: Average trips per active bike per day, Jun 2017–May 2018. See sql/README.md for notes.
SELECT
  COUNT(*) AS valid_trips,
  COUNT(DISTINCT CONCAT(CAST(bikeid AS STRING), '|', CAST(DATE(starttime) AS STRING))) AS active_bike_days,
  ROUND(COUNT(*) / COUNT(DISTINCT CONCAT(CAST(bikeid AS STRING), '|', CAST(DATE(starttime) AS STRING))), 2) AS trips_per_active_bike_day
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE starttime >= DATETIME '2017-06-01' AND starttime < DATETIME '2018-06-01';
