-- Query to calculate the-3 day rolling average of tweets publised by each user
-- Rolling average is a metric to analyze data points by creating a series of averages based on different subset of dataset.

WITH tab1 AS
(
  SELECT user_id, tweet_date, COUNT(tweet_id) AS tweet_count 
  FROM tweets
  GROUP BY user_id, tweet_date
)

SELECT user_id, tweet_date,
  ROUND(
    AVG(tweet_count) OVER(PARTITION BY user_id ORDER BY tweet_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
  ,2) AS rolling_avg_3days
FROM tab1;