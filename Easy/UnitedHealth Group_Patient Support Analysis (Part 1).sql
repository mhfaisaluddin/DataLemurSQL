-- Query to find how many UHG members made 3 or more calls.

SELECT COUNT(policy_holder_id) AS member_count 
FROM (
      SELECT policy_holder_id, COUNT(case_id) AS call_count
      FROM callers
      GROUP BY policy_holder_id
      HAVING COUNT(case_id) >= 3
      ) AS call_records;