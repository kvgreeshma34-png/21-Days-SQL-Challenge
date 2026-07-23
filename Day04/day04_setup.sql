USE synexus_db;

SELECT * FROM members 
WHERE designation = 'Founder';

SELECT * FROM events 
WHERE is_active = 1 AND event_date > '2026-06-01';

SELECT * FROM members 
ORDER BY last_name ASC;

SELECT * FROM members 
ORDER BY joined_at DESC 
LIMIT 1;