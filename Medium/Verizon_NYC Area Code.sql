-- How many phone calls have either a caller or receiver with a phone number with a Manhattan NYC area code.
-- The area code +1-212-xxx-xxxx

SELECT COUNT(*) AS nyc_count
FROM phone_calls
WHERE caller_id IN (
  SELECT caller_id 
  FROM phone_info
  WHERE LEFT(phone_number, 6) = '+1-212') 
OR receiver_id IN (
  SELECT caller_id
  FROM phone_info
  WHERE LEFT(phone_number, 6) = '+1-212');