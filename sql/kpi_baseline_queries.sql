-- BigQuery Standard SQL. Reconstructed templates from the chat, not job SQL exports.
-- Select ONE numbered statement and run the selected text. Running the full file
-- executes all ten statements and increases processing.
-- Queries 1-8: bigquery-public-data.new_york_citibike.citibike_trips.
-- Queries 9-10: bigquery-public-data.new_york_citibike.citibike_stations.
-- Confirm station-table lineage; station-only fields cannot come from trips alone.
-- Check estimated bytes. These statements use full available history/status.

-- 1. Trips over time: date/hour counts, not independently complete date coverage.
SELECT DATE(starttime) AS trip_date,
  EXTRACT(DAYOFWEEK FROM starttime) AS day_of_week,
  EXTRACT(HOUR FROM starttime) AS hour_of_day, COUNT(*) AS trips
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE starttime IS NOT NULL
GROUP BY trip_date, day_of_week, hour_of_day
ORDER BY trip_date, hour_of_day;

-- 2. Monthly mean and approximate median duration; seconds converted to minutes.
SELECT DATE_TRUNC(DATE(starttime), MONTH) AS month, COUNT(*) AS valid_trips,
  ROUND(AVG(tripduration) / 60, 1) AS average_minutes,
  ROUND(APPROX_QUANTILES(tripduration, 100)[OFFSET(50)] / 60, 1) AS median_minutes
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE starttime IS NOT NULL AND tripduration > 0
GROUP BY month ORDER BY month;

-- 3. Proxy only: distinct bikes ridden, not all bikes in service.
SELECT DATE(starttime) AS trip_date, COUNT(*) AS trips,
  COUNT(DISTINCT bikeid) AS bikes_used,
  ROUND(COUNT(*) / COUNT(DISTINCT bikeid), 2) AS trips_per_bike_used
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE starttime IS NOT NULL AND bikeid IS NOT NULL
GROUP BY trip_date ORDER BY trip_date;

-- 4. Departures/arrivals, one table reference.
-- ANY_VALUE names are unstable where an ID has multiple names. Verify by date.
SELECT station_id, ANY_VALUE(station_name) AS station_name,
  COUNTIF(flow = 'departure') AS departures,
  COUNTIF(flow = 'arrival') AS arrivals
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
CROSS JOIN UNNEST([
  STRUCT(start_station_id AS station_id, start_station_name AS station_name,
    'departure' AS flow),
  STRUCT(end_station_id AS station_id, end_station_name AS station_name,
    'arrival' AS flow)
])
WHERE station_id IS NOT NULL
GROUP BY station_id ORDER BY departures DESC;

-- 5. All-period net flow. Does not prove empty/full station conditions.
SELECT station_id, ANY_VALUE(station_name) AS station_name,
  SUM(arrivals) AS arrivals, SUM(departures) AS departures,
  SUM(arrivals) - SUM(departures) AS net_arrivals
FROM (
  SELECT end_station_id AS station_id, end_station_name AS station_name,
    COUNT(*) AS arrivals, 0 AS departures
  FROM `bigquery-public-data.new_york_citibike.citibike_trips`
  WHERE end_station_id IS NOT NULL GROUP BY station_id, station_name
  UNION ALL
  SELECT start_station_id AS station_id, start_station_name AS station_name,
    0 AS arrivals, COUNT(*) AS departures
  FROM `bigquery-public-data.new_york_citibike.citibike_trips`
  WHERE start_station_id IS NOT NULL GROUP BY station_id, station_name
)
GROUP BY station_id ORDER BY ABS(net_arrivals) DESC;

-- 6. Same-station rate; trip purpose is unknown.
SELECT COUNT(*) AS valid_trips,
  COUNTIF(start_station_id = end_station_id) AS same_station_trips,
  ROUND(SAFE_DIVIDE(COUNTIF(start_station_id = end_station_id),
    COUNT(*)) * 100, 2) AS round_trip_percent
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE start_station_id IS NOT NULL AND end_station_id IS NOT NULL;

-- 7. All-period rider mix, including undated rows; plan field was blank.
SELECT usertype, customer_plan, COUNT(*) AS trips,
  ROUND(SAFE_DIVIDE(COUNT(*), SUM(COUNT(*)) OVER ()) * 100, 2)
    AS trip_share_percent
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
GROUP BY usertype, customer_plan ORDER BY trips DESC;

-- 8. Bike-ID usage, not customer retention or repeated rider behavior.
SELECT bikeid, COUNT(*) AS trips,
  MIN(DATE(starttime)) AS first_trip_date,
  MAX(DATE(starttime)) AS last_trip_date
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE bikeid IS NOT NULL AND starttime IS NOT NULL
GROUP BY bikeid ORDER BY trips DESC;

-- 9. Latest status by station, not historical availability or a freshness test.
-- The year-2000 filter only excludes apparent epoch/sentinel reports.
WITH latest_station_status AS (
  SELECT station_id, capacity, num_bikes_available, num_docks_available,
    is_installed, is_renting, last_reported
  FROM `bigquery-public-data.new_york_citibike.citibike_stations`
  WHERE last_reported > TIMESTAMP '2000-01-01 00:00:00+00'
  QUALIFY ROW_NUMBER() OVER (
    PARTITION BY station_id ORDER BY last_reported DESC
  ) = 1
)
SELECT COUNT(*) AS stations_with_valid_reports,
  COUNTIF(num_bikes_available > 0) AS stations_with_bikes,
  ROUND(SAFE_DIVIDE(COUNTIF(num_bikes_available > 0), COUNT(*)) * 100, 2)
    AS stations_with_bikes_percent,
  COUNTIF(num_docks_available > 0) AS stations_with_open_docks,
  ROUND(SAFE_DIVIDE(COUNTIF(num_docks_available > 0), COUNT(*)) * 100, 2)
    AS stations_with_open_docks_percent,
  ROUND(SAFE_DIVIDE(SUM(num_bikes_available), SUM(capacity)) * 100, 2)
    AS capacity_utilization_percent
FROM latest_station_status WHERE is_installed = TRUE;

-- 10. Installed station counts/capacity by region. Verify region definitions.
SELECT region_id, COUNT(DISTINCT station_id) AS station_count,
  SUM(capacity) AS total_docks, ROUND(AVG(capacity), 1) AS average_docks_per_station
FROM `bigquery-public-data.new_york_citibike.citibike_stations`
WHERE is_installed = TRUE
GROUP BY region_id ORDER BY station_count DESC;
