-- Step 2: Check operational field population for rows missing starttime. See sql/README.md for notes.
SELECT
  COUNT(*) AS total_missing_starttime_rows,
  COUNT(stoptime) AS non_null_stoptime,
  COUNT(tripduration) AS non_null_tripduration,
  COUNT(start_station_id) AS non_null_start_station_id,
  COUNT(end_station_id) AS non_null_end_station_id,
  COUNT(bikeid) AS non_null_bikeid,
  COUNT(usertype) AS non_null_usertype
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE
  starttime IS NULL;
