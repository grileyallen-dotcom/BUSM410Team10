-- Step 8: Analyze trip distribution across days of the week by usertype. See sql/README.md for notes.
SELECT
  CASE
    WHEN EXTRACT(DAYOFWEEK FROM starttime) = 1 THEN '1_Sunday'
    WHEN EXTRACT(DAYOFWEEK FROM starttime) = 2 THEN '2_Monday'
    WHEN EXTRACT(DAYOFWEEK FROM starttime) = 3 THEN '3_Tuesday'
    WHEN EXTRACT(DAYOFWEEK FROM starttime) = 4 THEN '4_Wednesday'
    WHEN EXTRACT(DAYOFWEEK FROM starttime) = 5 THEN '5_Thursday'
    WHEN EXTRACT(DAYOFWEEK FROM starttime) = 6 THEN '6_Friday'
    WHEN EXTRACT(DAYOFWEEK FROM starttime) = 7 THEN '7_Saturday'
  END AS day_of_week,
  CASE
    WHEN EXTRACT(DAYOFWEEK FROM starttime) IN (1, 7) THEN 'Weekend'
    ELSE 'Weekday'
  END AS day_type,
  COUNTIF(usertype = 'Subscriber') AS subscriber_trips,
  COUNTIF(usertype = 'Customer') AS customer_trips,
  COUNT(*) AS total_trips,
  ROUND(COUNTIF(usertype = 'Customer') * 100.0 / COUNT(*), 1) AS pct_customer
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE
  starttime IS NOT NULL
GROUP BY
  day_of_week,
  day_type
ORDER BY
  day_of_week;
