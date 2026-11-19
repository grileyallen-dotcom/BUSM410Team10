-- Step 22: Part A3 suspect 2. Average Y by start hour (0–23). See sql/README.md.
-- Run by Norainelle Diaz, 2026-11-19. Hours sum to 4,474 trips over 24h. Lowest 5–9 am (<1 per 10k); rises to 4.2 at 3 pm; dips to ~2.5 at 5–6 pm; highest midnight–4 am (5.5–9.05).
-- Not a straight line, so the model should use time-of-day groups instead of hour as a number.
SELECT
  start_hour,
  COUNT(*) AS trips,
  SUM(over_24h) AS trips_over_24h,
  ROUND(AVG(over_24h) * 10000, 2) AS per_10k_trips
FROM `busm410-project.11234.trip_analysis`
GROUP BY start_hour
ORDER BY start_hour;
