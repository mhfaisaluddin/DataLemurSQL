-- Query to find out which manufacturer is associated with the non-profitable drugs.

WITH tab1 AS
(
  SELECT manufacturer, drug, (total_sales - cogs) AS total_lost
  FROM pharmacy_sales
  GROUP BY 1,2,3
  ORDER BY total_lost ASC
)

SELECT manufacturer, 
      COUNT(drug) AS drug_count, 
      ABS(SUM(total_lost)) AS total_loss
FROM tab1
WHERE total_lost < 1 
GROUP BY 1
ORDER BY total_loss DESC;