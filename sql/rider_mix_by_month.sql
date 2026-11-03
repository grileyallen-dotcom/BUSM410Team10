-- Dataset: bigquery-public-data.new_york_citibike
-- Table: citibike_trips
-- No date filter: preserve undated records and assess all available months.
-- Reads only starttime and usertype. Check BigQuery's bytes estimate first.
WITH monthly AS (
  SELECT
    DATE_TRUNC(DATE(starttime), MONTH) AS month,
    COUNT(*) AS total_rows,
    COUNT(DISTINCT DATE(starttime)) AS observed_dates,
    COUNTIF(LOWER(TRIM(usertype)) = 'subscriber') AS subscriber_trips,
    COUNTIF(LOWER(TRIM(usertype)) = 'customer') AS customer_trips,
    COUNTIF(NULLIF(TRIM(usertype), '') IS NULL) AS unknown_type_trips,
    COUNTIF(
      NULLIF(TRIM(usertype), '') IS NOT NULL
      AND LOWER(TRIM(usertype)) NOT IN ('subscriber', 'customer')
    ) AS other_type_trips
  FROM `bigquery-public-data.new_york_citibike.citibike_trips`
  GROUP BY month
)
SELECT
  month,
  IF(month IS NULL, 'Missing starttime', 'Dated records') AS timestamp_status,
  observed_dates,
  IF(month IS NULL, NULL, EXTRACT(DAY FROM LAST_DAY(month))) AS calendar_days,
  total_rows,
  subscriber_trips,
  customer_trips,
  unknown_type_trips,
  other_type_trips,
  ROUND(100 * SAFE_DIVIDE(subscriber_trips, total_rows), 2) AS subscriber_percent,
  ROUND(100 * SAFE_DIVIDE(customer_trips, total_rows), 2) AS customer_percent,
  ROUND(100 * SAFE_DIVIDE(unknown_type_trips, total_rows), 2) AS unknown_type_percent,
  ROUND(100 * SAFE_DIVIDE(other_type_trips, total_rows), 2) AS other_type_percent
FROM monthly
ORDER BY month;
