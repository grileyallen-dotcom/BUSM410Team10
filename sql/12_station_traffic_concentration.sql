-- Step 12: Identify the top 20 stations by combined departure and arrival volume. See sql/notes.md for notes.
SELECT
  station_name,
  SUM(departures) AS total_departures,
  SUM(arrivals) AS total_arrivals,
  SUM(departures) + SUM(arrivals) AS total_activity,
  ROUND(SUM(departures) * 100.0 / SUM(SUM(departures)) OVER (), 2) AS pct_of_all_departures
FROM (
  SELECT start_station_name AS station_name, COUNT(*) AS departures, 0 AS arrivals
  FROM `bigquery-public-data.new_york_citibike.citibike_trips`
  WHERE starttime IS NOT NULL AND start_station_name IS NOT NULL
  GROUP BY start_station_name

  UNION ALL

  SELECT end_station_name AS station_name, 0 AS departures, COUNT(*) AS arrivals
  FROM `bigquery-public-data.new_york_citibike.citibike_trips`
  WHERE starttime IS NOT NULL AND end_station_name IS NOT NULL
  GROUP BY end_station_name
)
GROUP BY station_name
ORDER BY total_activity DESC
LIMIT 20;
