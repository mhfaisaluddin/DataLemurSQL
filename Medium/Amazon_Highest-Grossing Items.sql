-- Identify the top two highest-grossing products within each category in 2022.

WITH 
tab1 AS
(
  SELECT category, product, SUM(spend) AS total_spend
  FROM product_spend
  WHERE DATE_PART('year', transaction_date) = '2022'
  GROUP BY 1,2
),

tab2 AS
(
  SELECT category, product, total_spend,
    DENSE_RANK() OVER(PARTITION BY category ORDER BY total_spend DESC) AS ranking
  FROM tab1
)

SELECT category, product, total_spend
FROM tab2
WHERE ranking IN (1,2);