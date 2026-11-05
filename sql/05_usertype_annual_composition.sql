-- Step 5: Annual breakdown of valid trips by usertype. See sql/README.md for notes.
SELECT
  EXTRACT(YEAR FROM starttime) AS trip_year,
  usertype,
  COUNT(*) AS trip_count
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE
  starttime IS NOT NULL
GROUP BY
  trip_year,
  usertype
ORDER BY
  trip_year ASC,
  trip_count DESC;
