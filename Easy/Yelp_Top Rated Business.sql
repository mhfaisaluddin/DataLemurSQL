-- Query to obtain the number and percentage of business that are top rated.
-- A top-rated business is defined as one whose reviews contain only 4 or 5 stars.

SELECT 
  SUM(CASE WHEN review_stars IN (4, 5) THEN 1 ELSE 0 END) AS business_count,
  ROUND(
        100 *
        (SUM
            (CASE WHEN review_stars IN (4,5) THEN 1 ELSE 0 END):: NUMERIC /
            COUNT(business_id)
        ),
  0) AS top_rated_pct
FROM reviews;