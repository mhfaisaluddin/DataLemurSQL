-- Query to get the mean, median, mode from the inbox_stats table.

SELECT 
  ROUND(AVG(email_count)) AS mean,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY email_count) AS median,
  MODE() WITHIN GROUP (ORDER BY email_count) AS mode
FROM inbox_stats;