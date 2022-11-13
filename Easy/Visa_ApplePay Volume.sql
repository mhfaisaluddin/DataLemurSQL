-- Query to calculate the total transaction volume for each merchant
-- where the tansaction was performed via ApplePay.

SELECT merchant_id, 
      SUM(
        CASE 
        WHEN payment_method LIKE '%ppl%' THEN transaction_amount
        ELSE 0 END) AS total_transaction
FROM transactions
GROUP BY 1
ORDER BY 2 DESC;