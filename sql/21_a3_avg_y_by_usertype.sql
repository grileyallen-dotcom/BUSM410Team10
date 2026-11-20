-- Step 21: Part A3 suspect 1. Average Y (share of trips over 24h) by usertype. See sql/README.md.
-- Run by Norainelle Diaz, 2026-11-19. 319.87 MB (BigQuery). Customer 2,883 / 1,804,498 (15.98 per 10k); Subscriber 1,591 / 15,146,532 (1.05 per 10k). Matches Query 16.
SELECT
  usertype,
  COUNT(*) AS trips,
  SUM(over_24h) AS trips_over_24h,
  ROUND(AVG(over_24h), 5) AS avg_y,
  ROUND(AVG(over_24h) * 10000, 2) AS per_10k_trips
FROM `busm410-project.11234.trip_analysis`
GROUP BY usertype
ORDER BY usertype;
