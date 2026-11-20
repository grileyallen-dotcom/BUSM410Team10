-- Step 21: Split CP1 gap (Customer vs. Subscriber >24h rate) by start_area (CP2 Part A location split). See sql/README.md for notes.
SELECT
  start_area,
  usertype,
  COUNT(*) AS valid_trips,
  SUM(is_over_24h) AS trips_over_24h,
  ROUND(AVG(is_over_24h) * 10000, 2) AS over_24h_per_10k,
  ROUND(AVG(is_over_24h) * 100, 4) AS avg_y_pct
FROM `busm410-project.citibike_cp2.cp2_trip_analysis`
GROUP BY start_area, usertype
ORDER BY start_area, usertype;
