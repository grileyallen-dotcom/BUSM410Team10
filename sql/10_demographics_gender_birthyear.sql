-- Step 10: Check gender categories, birth_year population rates, and plausibility among valid trips. See sql/notes.md for notes.
SELECT
  gender,
  COUNT(*) AS total_trips,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1) AS pct_of_total,
  COUNTIF(birth_year IS NULL) AS null_birth_year,
  COUNTIF(birth_year IS NOT NULL AND birth_year < 1900) AS implausible_birth_year,
  COUNTIF(birth_year IS NOT NULL AND birth_year BETWEEN 1900 AND 2000) AS plausible_birth_year,
  MIN(birth_year) AS min_birth_year,
  MAX(birth_year) AS max_birth_year,
  ROUND(AVG(birth_year), 0) AS avg_birth_year
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE
  starttime IS NOT NULL
GROUP BY
  gender
ORDER BY
  total_trips DESC;
