-- Query to obtain the third transaction of every user
-- Output the user id, spend, and transaction date

WITH tmp AS(
    SELECT user_id, spend, transaction_date, 
      DENSE_RANK() OVER(PARTITION BY user_id ORDER BY transaction_date ASC)
    FROM transactions)

SELECT user_id, spend, transaction_date
FROM tmp
WHERE dense_rank = 3;