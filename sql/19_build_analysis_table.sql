-- Step 19: Build CP2 Part A analysis table (1 row per valid trip, Jun 2017–May 2018). See sql/README.md for notes.
CREATE OR REPLACE TABLE `busm410-project.citibike_cp2.cp2_trip_analysis` AS
SELECT
  CASE WHEN tripduration > 86400 THEN 1 ELSE 0 END AS is_over_24h,
  COALESCE(NULLIF(TRIM(usertype), ''), 'Unknown') AS usertype,
  COALESCE(NULLIF(TRIM(gender), ''), 'unknown') AS gender,
  CASE
    WHEN EXTRACT(DAYOFWEEK FROM starttime) IN (1, 7) THEN 'Weekend'
    ELSE 'Weekday'
  END AS day_type,
  CASE
    WHEN EXTRACT(HOUR FROM starttime) BETWEEN 6 AND 11 THEN 'Morning_06_11'
    WHEN EXTRACT(HOUR FROM starttime) BETWEEN 12 AND 17 THEN 'Afternoon_12_17'
    WHEN EXTRACT(HOUR FROM starttime) BETWEEN 18 AND 21 THEN 'Evening_18_21'
    ELSE 'Overnight_22_05'
  END AS time_of_day,
  CASE
    WHEN EXTRACT(MONTH FROM starttime) IN (6, 7, 8) THEN 'Summer'
    WHEN EXTRACT(MONTH FROM starttime) IN (9, 10, 11) THEN 'Fall'
    WHEN EXTRACT(MONTH FROM starttime) IN (12, 1, 2) THEN 'Winter'
    ELSE 'Spring'
  END AS season,
  CASE
    WHEN start_station_latitude IS NULL
      OR start_station_longitude IS NULL
      OR start_station_latitude NOT BETWEEN 40.5 AND 41.0
      OR start_station_longitude NOT BETWEEN -74.3 AND -73.7
      THEN 'Unknown'
    WHEN (start_station_latitude < 40.700 AND start_station_longitude > -73.960)
      OR (start_station_latitude < 40.715 AND start_station_longitude > -73.950)
      THEN 'Central_East_Brooklyn'
    WHEN (start_station_latitude < 40.700 AND start_station_longitude > -74.012)
      OR (start_station_latitude < 40.710 AND start_station_longitude > -73.996)
      OR (start_station_latitude < 40.737 AND start_station_longitude > -73.970)
      THEN 'West_North_Brooklyn'
    WHEN start_station_latitude >= 40.737
      AND start_station_longitude > (-73.965 + 0.75 * (start_station_latitude - 40.737))
      THEN 'Queens'
    WHEN start_station_longitude >= -74.025
      THEN 'Manhattan'
    ELSE 'Other_NJ'
  END AS start_area
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE starttime >= DATETIME '2017-06-01'
  AND starttime < DATETIME '2018-06-01';
