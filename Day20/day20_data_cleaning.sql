USE synexus_db;

INSERT IGNORE INTO members (first_name, last_name, email, designation) 
VALUES ('casey', 'smith', 'casey.messy@synexus.com', NULL);

SELECT 
    UPPER(CONCAT(first_name, ' ', last_name)) AS full_name,
    COALESCE(designation, 'Unassigned') AS clean_designation
FROM members
WHERE (first_name = 'Jordan' AND last_name = 'Vance')
   OR (first_name = 'Taylor' AND last_name = 'Brooks')
   OR (LOWER(first_name) = 'casey' AND LOWER(last_name) = 'smith')
ORDER BY FIELD(full_name, 'JORDAN VANCE', 'TAYLOR BROOKS', 'CASEY SMITH');

SELECT 
    event_name,
    YEAR(event_date) AS event_year,
    MONTHNAME(event_date) AS event_month
FROM events;