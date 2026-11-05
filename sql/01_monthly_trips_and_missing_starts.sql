-- Step 1: Monthly trip volume and missing starttime check. See sql/README.md for notes.
SELECT
  COALESCE(FORMAT_DATETIME('%Y-%m', starttime), 'MISSING_STARTTIME') AS trip_month,
  COUNT(*) AS trip_count
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE
  starttime IS NULL
  OR (EXTRACT(YEAR FROM starttime) BETWEEN 2013 AND 2018)
GROUP BY
  trip_month
ORDER BY
  trip_month;
