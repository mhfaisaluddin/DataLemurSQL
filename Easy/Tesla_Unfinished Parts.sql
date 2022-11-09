-- Query the parts which have begun the assembly process but are not yet finished

SELECT DISTINCT part
FROM parts_assembly
WHERE finish_date IS NULL;
