-- Step 3: Inspect usertype values and string lengths for missing starttimes. See sql/notes.md for notes.
SELECT
  usertype,
  LENGTH(usertype) AS string_length,
  COUNT(*) AS row_count
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE
  starttime IS NULL
GROUP BY
  usertype,
  string_length
ORDER BY
  row_count DESC;
