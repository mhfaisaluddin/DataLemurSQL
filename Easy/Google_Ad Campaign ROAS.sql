-- Query to calculate the return on ad spend (ROAS) for each advertiser across all ad campaigns.
-- ROAS =  Ad Revenue / Ad Spend

SELECT advertiser_id, 
      ROUND(CAST(SUM(revenue)/SUM(spend) AS NUMERIC), 2) AS ROAS
FROM ad_campaigns
GROUP BY advertiser_id
ORDER BY advertiser_id;