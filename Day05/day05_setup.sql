USE synexus_db;

SELECT * FROM members
WHERE first_name LIKE 'A%';

SELECT * FROM members
WHERE designation IN ('Founder', 'Chief Creative Officer', 'Backend & Java Lead');

SELECT * FROM events
WHERE event_date BETWEEN '2026-09-01' AND '2026-12-31';