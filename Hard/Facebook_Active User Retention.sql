-- Query to obtain the active user retention in July 2022.
-- An active user is a user who has user action ("sign-in","like", or "comment").

SELECT
  a.month,
  COUNT(a.user_id)
FROM (
  SELECT
    user_id,
    EXTRACT(MONTH FROM event_date) AS month
  FROM user_actions
  WHERE user_id IN (SELECT
                      user_id
                    FROM user_actions
                    WHERE EXTRACT(MONTH FROM event_date) = 6)
        AND EXTRACT(MONTH FROM event_date) = 7
  GROUP BY user_id, month
) a
GROUP BY a.month;