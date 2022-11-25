-- Query to get the percentage of international phone calls, both the caller and receiver.

WITH tab1 AS (
  SELECT 
    caller.caller_id, 
    caller.country_id,
    receiver.caller_id, 
    receiver.country_id
  FROM phone_calls AS calls
  LEFT JOIN phone_info AS caller
    ON calls.caller_id = caller.caller_id
  LEFT JOIN phone_info AS receiver
    ON calls.receiver_id = receiver.caller_id
  WHERE caller.country_id <> receiver.country_id
)

SELECT ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM phone_calls), 1)
  AS international_call_pct
FROM tab1