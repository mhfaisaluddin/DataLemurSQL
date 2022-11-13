-- Query to get the app's click-through rate (CTR %) in 2022.
-- CTR = 100 * number of clicks / number of impressions

WITH tmp AS(
      SELECT app_id, 
            SUM(CASE WHEN event_type = 'click' THEN 1 END) AS clicks,
            SUM(CASE WHEN event_type = 'impression' THEN 1 END) AS impress
      FROM events
      WHERE EXTRACT(YEAR FROM timestamp) = '2022'
      GROUP BY app_id)

SELECT app_id, ROUND(100.0 * clicks / impress, 2) AS ctr
from tmp