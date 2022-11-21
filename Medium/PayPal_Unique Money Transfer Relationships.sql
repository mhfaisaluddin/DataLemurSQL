-- Query to find the number of two-way unique relationships in the data.
-- A two-way unique relationship is established when two people send money back and forth.

SELECT COUNT(payer_id) / 2 AS unique_relationships
FROM (
  SELECT payer_id, recipient_id
  FROM payments
  INTERSECT
  SELECT recipient_id, payer_id
  FROM payments
) AS relationships;