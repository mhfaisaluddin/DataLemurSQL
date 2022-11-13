-- Query to find the top 2 power users who sent the most messages on Microsoft Teams in August 2022.
-- Display the IDs, and the total number of messages they sent.

SELECT sender_id, COUNT(sender_id) AS message_count
FROM messages
WHERE sent_date BETWEEN '2022-08-01' AND '2022-08-30'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 2;