-- Step 23: Part A3 suspect 3. Average Y by gender. See sql/README.md.
-- Run by Norainelle Diaz, 2026-11-19. 238.51 MB (BigQuery). female 967 / 3,870,491 (2.50 per 10k); male 2,228 / 11,401,341 (1.95); unknown 1,279 / 1,679,198 (7.62). Sums to 4,474.
-- "unknown" may be mostly casual riders, so this could overlap with usertype; the model holds usertype steady.
SELECT
  gender,
  COUNT(*) AS trips,
  SUM(over_24h) AS trips_over_24h,
  ROUND(AVG(over_24h) * 10000, 2) AS per_10k_trips
FROM `busm410-project.11234.trip_analysis`
GROUP BY gender
ORDER BY gender;
