/* ========================================== */
/* DAY 13: Clean Multi-Step Logic (CTEs)      */
/* ========================================== */

-- 1. Select the database
USE synexus_db;

-- 2. Align member names to match the challenge
UPDATE members SET first_name = 'Akash' WHERE member_id = 1;
UPDATE members SET first_name = 'Akshay' WHERE member_id = 3;

-- 3. Clear existing attendance to prevent duplicate row counts
TRUNCATE TABLE attendance;

-- 4. Insert clean attendance records (Akash: 3 events, Akshay: 2 events)
INSERT INTO attendance (member_id, event_id) 
VALUES 
(1, 1),
(1, 2),
(1, 3),
(3, 1),
(3, 2);

-- 5. The CTE Query
WITH MemberAttendance AS (
    SELECT m.member_id, m.first_name, COUNT(a.scan_id) AS total_events_attended 
    FROM members m 
    INNER JOIN attendance a ON m.member_id = a.member_id 
    GROUP BY m.member_id, m.first_name
)
SELECT member_id, first_name, total_events_attended 
FROM MemberAttendance 
WHERE total_events_attended > 1;