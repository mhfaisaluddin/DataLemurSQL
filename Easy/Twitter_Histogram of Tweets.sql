-- Query to obtain tweets posted per user in 2022

WITH tweet_counter AS(
  SELECT COUNT(tweet_id) AS tweet_count, user_id FROM tweets
  WHERE tweet_date BETWEEN '2022-01-01' AND '2022-12-31'
  GROUP BY user_id)
  
SELECT tweet_count as tweet_bucket, COUNT(user_id) as users_num
FROM tweet_counter
GROUP BY tweet_count;