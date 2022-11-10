-- Query the total viewership for laptop and mobile devices

WITH count_info AS
(SELECT
  (SELECT COUNT(device_type) FROM viewership 
    WHERE device_type='laptop') AS laptop_views,
  (SELECT COUNT(*) FROM viewership 
    WHERE device_type IN ('tablet','phone')) AS mobile_views
)

SELECT laptop_views, mobile_views
FROM count_info;