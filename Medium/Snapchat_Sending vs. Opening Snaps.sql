-- Query to obtain a breakdown of the time spent sending vs. opening snaps for each age group.
-- Calculate the percentages:
-- time sending / (time sending + time opening)
-- time opening / (time sending + time opening)

WITH 
  age_bucket_activity AS
  (
    SELECT ab.age_bucket, a.activity_type, a.time_spent
    FROM activities a INNER JOIN age_breakdown ab ON a.user_id = ab.user_id
    WHERE a.activity_type IN ('send', 'open')
  ),

  calculated_time AS
  (
    SELECT age_bucket,
      SUM(CASE WHEN activity_type = 'open' THEN time_spent ELSE 0 END) AS sum_open,
      SUM(CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 END) AS sum_send,
      SUM(time_spent) AS total_sum
    FROM age_bucket_activity GROUP BY age_bucket
  )

SELECT age_bucket,
  ROUND(100.0 * sum_send / total_sum, 2) AS send_perc,
  ROUND(100.0 * sum_open / total_sum, 2) AS open_perc
FROM calculated_time;