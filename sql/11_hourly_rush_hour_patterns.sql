-- Step 11: Analyze hourly trip volume by usertype to identify rush-hour and leisure patterns. See sql/README.md for notes.
SELECT
  EXTRACT(HOUR FROM starttime) AS hour_of_day,
  COUNTIF(usertype = 'Subscriber') AS subscriber_trips,
  COUNTIF(usertype = 'Customer') AS customer_trips,
  COUNT(*) AS total_trips
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE
  starttime IS NOT NULL
GROUP BY
  hour_of_day
ORDER BY
  hour_of_day;
