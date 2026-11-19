-- Step 20: Check the analysis table for row count, Y count, blanks, and impossible values. See sql/README.md.
-- Run by Norainelle Diaz, 2026-11-18. Results: 16,951,030 rows (matches Query 16); 4,474 with Y = 1 (matches 2,883 + 1,591);
-- 0 blanks in Y, usertype, gender, station, or location; age 0–97 with 1,187,509 missing (0 + flag); hours 0–23; 7 days; 12 months.
SELECT
  COUNT(*) AS total_rows,
  SUM(over_24h) AS y_equals_1,
  COUNTIF(over_24h IS NULL) AS blank_y,
  COUNTIF(usertype IS NULL OR usertype = '') AS blank_usertype,
  COUNTIF(gender IS NULL) AS blank_gender,
  COUNTIF(start_station_name IS NULL) AS blank_station,
  COUNTIF(start_station_latitude IS NULL OR start_station_longitude IS NULL) AS blank_location,
  MIN(age) AS min_age, MAX(age) AS max_age,
  SUM(age_missing) AS age_missing_rows,
  MIN(start_hour) AS min_hour, MAX(start_hour) AS max_hour,
  COUNT(DISTINCT day_of_week) AS days,
  COUNT(DISTINCT trip_month) AS months
FROM `busm410-project.11234.trip_analysis`;
