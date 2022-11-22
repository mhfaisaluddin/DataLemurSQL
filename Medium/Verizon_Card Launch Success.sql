-- Query that outpost the name of the credit card, and how many cards were issued in its lainc month.

WITH tab1 AS (
SELECT 
  card_name,
  issued_amount,
  MAKE_DATE(issue_year, issue_month, 1) AS issue_date,
  MIN(MAKE_DATE(issue_year, issue_month, 1)) OVER (
    PARTITION BY card_name) AS launch_date
FROM monthly_cards_issued
)

SELECT card_name, issued_amount
FROM tab1
WHERE issue_date = launch_date
ORDER BY issued_amount DESC;