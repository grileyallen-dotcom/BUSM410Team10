-- Step 22: Compare grouped average Y (is_over_24h) for each of the 6 X variables (CP2 Part A suspects). See sql/README.md for notes.
SELECT 'usertype' AS x_variable, usertype AS x_value,
  COUNT(*) AS valid_trips, SUM(is_over_24h) AS trips_over_24h,
  ROUND(AVG(is_over_24h) * 10000, 2) AS over_24h_per_10k,
  ROUND(AVG(is_over_24h) * 100, 4) AS avg_y_pct
FROM `busm410-project.citibike_cp2.cp2_trip_analysis`
GROUP BY usertype

UNION ALL
SELECT 'gender', gender,
  COUNT(*), SUM(is_over_24h),
  ROUND(AVG(is_over_24h) * 10000, 2),
  ROUND(AVG(is_over_24h) * 100, 4)
FROM `busm410-project.citibike_cp2.cp2_trip_analysis`
GROUP BY gender

UNION ALL
SELECT 'day_type', day_type,
  COUNT(*), SUM(is_over_24h),
  ROUND(AVG(is_over_24h) * 10000, 2),
  ROUND(AVG(is_over_24h) * 100, 4)
FROM `busm410-project.citibike_cp2.cp2_trip_analysis`
GROUP BY day_type

UNION ALL
SELECT 'time_of_day', time_of_day,
  COUNT(*), SUM(is_over_24h),
  ROUND(AVG(is_over_24h) * 10000, 2),
  ROUND(AVG(is_over_24h) * 100, 4)
FROM `busm410-project.citibike_cp2.cp2_trip_analysis`
GROUP BY time_of_day

UNION ALL
SELECT 'season', season,
  COUNT(*), SUM(is_over_24h),
  ROUND(AVG(is_over_24h) * 10000, 2),
  ROUND(AVG(is_over_24h) * 100, 4)
FROM `busm410-project.citibike_cp2.cp2_trip_analysis`
GROUP BY season

UNION ALL
SELECT 'start_area', start_area,
  COUNT(*), SUM(is_over_24h),
  ROUND(AVG(is_over_24h) * 10000, 2),
  ROUND(AVG(is_over_24h) * 100, 4)
FROM `busm410-project.citibike_cp2.cp2_trip_analysis`
GROUP BY start_area

ORDER BY x_variable, over_24h_per_10k DESC;
