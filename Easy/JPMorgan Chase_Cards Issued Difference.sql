-- Query to get how many credit cards were issued each month.
-- Get the name of each credit card and the difference in issued amount
-- between the month with the most cards issued, and the least cards issued.

SELECT card_name, MAX(issued_amount) - MIN(issued_amount) AS difference 
FROM monthly_cards_issued
GROUP BY 1
ORDER BY 2 DESC;