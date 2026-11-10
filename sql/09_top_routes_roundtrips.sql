-- Step 9: Identify top 10 station pairs, route durations, and round-trip loop prevalence. See sql/README.md for notes.
SELECT
  start_station_name,
  end_station_name,
  COUNT(*) AS trip_count,
  ROUND(AVG(tripduration) / 60.0, 1) AS avg_duration_min,
  CASE WHEN start_station_name = end_station_name THEN TRUE ELSE FALSE END AS is_round_trip
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE
  starttime IS NOT NULL
  AND start_station_name IS NOT NULL
  AND end_station_name IS NOT NULL
GROUP BY
  start_station_name,
  end_station_name,
  is_round_trip
ORDER BY
  trip_count DESC
LIMIT 10;
