-- Step 18: Over-24h trips by start station, Jun 2017–May 2018 (rules C1, C2). See sql/README.md for notes.
-- Run by Norainelle Diaz 2026-11-12. ~2.44 GB scan (BigQuery's estimate).
-- Stations with fewer than 1,000 trips are dropped so small counts don't inflate rates.
-- Top station: Fulton St & Utica Ave, 156 trips over 24h (228.94 per 10k). Top 7 are central Brooklyn with 8–21% Customer share.
SELECT
  start_station_name,
  COUNT(*) AS valid_trips,
  ROUND(COUNTIF(usertype = 'Customer') * 100.0 / COUNT(*), 1) AS pct_customer_trips,
  COUNTIF(tripduration > 86400) AS trips_over_24h,
  ROUND(COUNTIF(tripduration > 86400) * 10000.0 / COUNT(*), 2) AS over_24h_per_10k_trips,
  ROUND(COUNTIF(tripduration > 86400) * 100.0
        / SUM(COUNTIF(tripduration > 86400)) OVER (), 2) AS pct_of_all_over_24h
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE
  starttime >= DATETIME '2017-06-01'
  AND starttime < DATETIME '2018-06-01'
GROUP BY
  start_station_name
HAVING
  COUNT(*) >= 1000
ORDER BY
  trips_over_24h DESC
LIMIT 25;
