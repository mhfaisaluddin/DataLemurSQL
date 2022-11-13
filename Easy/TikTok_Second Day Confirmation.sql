-- Query to display the users who did not confirm on the first day of sign-up, 
-- but confirmed on the second day.

SELECT e.user_id 
FROM emails AS e LEFT JOIN texts AS t ON e.email_id = t.email_id
GROUP BY e.user_id
HAVING EXTRACT(DAY FROM MAX(t.action_date)-MIN(e.signup_date)) = 1