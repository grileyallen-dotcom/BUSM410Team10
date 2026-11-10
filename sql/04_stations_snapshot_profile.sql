-- Step 4: Profile station count, identifier uniqueness, snapshot timestamps, and capacity. See sql/README.md for notes.
SELECT
  COUNT(*) AS total_stations,
  COUNT(DISTINCT station_id) AS distinct_station_ids,
  MIN(last_reported) AS earliest_last_reported,
  MAX(last_reported) AS latest_last_reported,
  MIN(capacity) AS min_capacity,
  ROUND(AVG(capacity), 1) AS avg_capacity,
  MAX(capacity) AS max_capacity
FROM
  `bigquery-public-data.new_york_citibike.citibike_stations`;
