-- Query to find the total monthly unused server capacity for each data center
-- Output the data center id in ascending order and the total spare capacity.

SELECT d.datacenter_id, d.monthly_capacity - SUM(monthly_demand) AS spare_capacity
FROM datacenters AS d JOIN forecasted_demand AS fr
ON d.datacenter_id = fr.datacenter_id
GROUP BY d.datacenter_id, d.monthly_capacity
ORDER BY d.datacenter_id;