-- Query to return the IDs of LinkedIn power creators.
-- Power creators is a people with more followers than the company they work for.

SELECT p.profile_id
FROM personal_profiles AS p LEFT JOIN company_pages AS c 
ON p.employer_id = c.company_id
WHERE p.followers > c.followers
ORDER BY 1 ASC;