-- Query to find the percentage of calls that cannot be categorised.

SELECT
  ROUND(100.0 * 
    COUNT(case_id) FILTER (
      WHERE call_category = 'n/a' OR call_category IS NULL) /
      COUNT(case_id), 1) 
    AS uncategorised_pct
FROM callers;