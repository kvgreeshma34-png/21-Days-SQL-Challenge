USE synexus_db;

SET SQL_SAFE_UPDATES = 0;

UPDATE members 
SET designation = 'Lead Developer'
WHERE email = 'kvgreeshma34@gmail.com';

SELECT * FROM members WHERE email = 'kvgreeshma34@gmail.com';

DELETE FROM events
WHERE event_name = 'Bengaluru Tech Summit 2026';

SELECT * FROM events;

SET SQL_SAFE_UPDATES = 1;