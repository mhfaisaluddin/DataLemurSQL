-- Query to get number of unique product combinations that are bought together.

WITH info AS(
  SELECT 
    t.product_id,
    t.transaction_id,
    p.product_name
  FROM transactions t
    INNER JOIN products p ON t.product_id = p.product_id
)

SELECT 
  COUNT(*) AS combo_number
FROM info AS p1
  INNER JOIN info AS p2 ON p1.transaction_id = p2.transaction_id
    AND p1.product_id > p2.product_id;