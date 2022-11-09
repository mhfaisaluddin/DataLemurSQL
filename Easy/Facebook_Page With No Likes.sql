-- Query to return the page IDs of all the FB pages that don't have any likes

SELECT p.page_id
FROM pages AS p LEFT JOIN page_likes AS pl
ON p.page_id = pl.page_id
WHERE pl.user_id IS NULL
ORDER BY p.page_id ASC;
