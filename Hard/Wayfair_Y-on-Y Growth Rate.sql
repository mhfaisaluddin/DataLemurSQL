-- Query to obtain the year-on-year growth rate for the total spend of each product for each year.
-- The steps:
-- 1. Summarizing user transactions table into a table containing the yearly spend information.
-- 2. Find the prior year's spend and keep the information parallel with current year's spend row.
-- 3. Get the variance between current year and prior year's spend and apply the y-o-y growth rate formula.

WITH yearly_spend AS
(
  SELECT 
    EXTRACT(YEAR FROM transaction_date) AS year,
    product_id,
    spend AS curr_year_spend
  FROM user_transactions
),

yearly_var AS
(
  SELECT *,
    LAG(curr_year_spend, 1) OVER(
      PARTITION BY product_id
      ORDER BY product_id, year) AS prev_year_spend
  FROM yearly_spend
)

SELECT
  year,
  product_id,
  curr_year_spend,
  prev_year_spend,
  ROUND(100*(curr_year_spend - prev_year_spend)/prev_year_spend, 2) AS yoy
FROM yearly_var