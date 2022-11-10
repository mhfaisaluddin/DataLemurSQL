-- Query to list the top 3 cities that have the most completed trade orders in descending order

SELECT u.city, COUNT(u.city) AS total_orders
FROM trades AS t LEFT JOIN users AS u ON t.user_id = u.user_id
WHERE t.status='Completed'
GROUP BY u.city
ORDER BY total_orders DESC
LIMIT 3;