-- Step 19: Build the CP2 analysis table. One row = one trip, Jun 2017–May 2018 (C1, C2). See sql/README.md.
-- Y = over_24h (1/0). X's use only facts known when the trip starts. Blank/impossible birth years set to 0 and flagged.
-- Run by Norainelle Diaz, 2026-11-18. 3.93 GB processed (BigQuery). Saved as busm410-project.11234.trip_analysis.
CREATE OR REPLACE TABLE `busm410-project.11234.trip_analysis` AS
SELECT
  CASE WHEN tripduration > 86400 THEN 1 ELSE 0 END AS over_24h,
  usertype,
  COALESCE(NULLIF(gender, ''), 'unknown') AS gender,
  CASE WHEN birth_year BETWEEN 1920 AND 2002
       THEN EXTRACT(YEAR FROM starttime) - birth_year ELSE 0 END AS age,
  CASE WHEN birth_year BETWEEN 1920 AND 2002 THEN 0 ELSE 1 END AS age_missing,
  EXTRACT(HOUR FROM starttime) AS start_hour,
  FORMAT_DATETIME('%u_%A', starttime) AS day_of_week,
  FORMAT_DATETIME('%Y-%m', starttime) AS trip_month,
  start_station_name,
  start_station_latitude,
  start_station_longitude
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE
  starttime >= DATETIME '2017-06-01'
  AND starttime < DATETIME '2018-06-01';
