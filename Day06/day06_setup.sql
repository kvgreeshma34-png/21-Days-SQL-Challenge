USE synexus_db;

INSERT INTO events (event_name, event_date) 
VALUES ('Secret Pop-up Hackathon', '2026-11-01');

SELECT * FROM events 
WHERE location IS NULL;

SELECT * FROM members 
WHERE designation IS NOT NULL;

SELECT first_name, designation, 
CASE 
    WHEN designation = 'Founder' OR designation = 'Chief Strategic Officer' THEN 'Core Leadership'
    ELSE 'General Member'
END AS role_category
FROM members;