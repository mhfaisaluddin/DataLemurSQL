-- Query to obtain the sum of the odd-numbered and even-numbered measurements
-- on a particular day.

WITH tmp AS
(
  SELECT measurement_id, measurement_value, measurement_time,
    DATE(measurement_time) AS measurement_day,
    DENSE_RANK() OVER(PARTITION BY DATE(measurement_time) ORDER BY measurement_time ASC) AS measurement_num
  FROM measurements
)

SELECT measurement_day,
  SUM(CASE WHEN measurement_num IN (1,3,5) THEN measurement_value ELSE 0 END) AS odd_sum,
  SUM(CASE WHEN measurement_num IN (2,4,6) THEN measurement_value ELSE 0 END) AS even_sum
FROM tmp
GROUP BY measurement_day;