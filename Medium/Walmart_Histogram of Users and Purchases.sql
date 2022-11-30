-- Query to get the user's most recent transaction date, user ID
-- and the number of product sorted by the transaction date.

WITH latest_transaction AS (
  SELECT 
    transaction_date, 
    user_id, 
    product_id, 
    RANK() OVER (PARTITION BY user_id 
      ORDER BY transaction_date DESC) AS days_rank 
  FROM user_transactions) 
  
SELECT 
  transaction_date, 
  user_id,
  COUNT(product_id) AS purchase_count
FROM latest_transaction
WHERE days_rank = 1 
GROUP BY transaction_date, user_id
ORDER BY transaction_date;