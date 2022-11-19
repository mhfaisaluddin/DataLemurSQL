-- Query to find the confirmation rate of users who confirmed their signups with text messages.

WITH rate AS (
  SELECT user_id,
    CASE WHEN texts.email_id IS NOT NULL THEN 1 ELSE 0 END AS signup
  FROM emails LEFT JOIN texts
    ON emails.email_id = texts.email_id
    AND signup_action = 'Confirmed'
)

SELECT ROUND(SUM(signup)::DECIMAL / COUNT(user_id), 2) AS confirm_rate
FROM rate;