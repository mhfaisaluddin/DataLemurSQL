-- Query to find the top 2 drugs sold, in terms of units sold, for each manufacturer.

WITH tab1 AS
(
  SELECT manufacturer, drug, units_sold,
    DENSE_RANK() OVER(PARTITION BY manufacturer ORDER BY units_sold DESC) AS ranking
  FROM pharmacy_sales
  ORDER BY 1 ASC
)

SELECT manufacturer, drug
FROM tab1
WHERE ranking IN (1,2);