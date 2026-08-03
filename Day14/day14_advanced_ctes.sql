/* ========================================== */
/* DAY 14: Chaining Logic (Multiple CTEs)      */
/* ========================================== */

-- 1. Select the database
USE synexus_db;

-- ==========================================
-- STEP 1: Reset and Align Data Safely
-- ==========================================
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE attendance;
TRUNCATE TABLE events;
TRUNCATE TABLE members;
SET FOREIGN_KEY_CHECKS = 1;

-- Insert required events first, including event_date
INSERT INTO events (event_id, event_name, event_date) VALUES
(1, 'Tech Workshop', '2026-08-01'),
(2, 'Code Jam', '2026-08-02'),
(3, 'AI Summit', '2026-08-03'),
(4, 'Web Dev Bootcamp', '2026-08-04'),
(5, 'Cloud Masterclass', '2026-08-05');

-- Insert specific members matching the expected scenario
INSERT INTO members (member_id, first_name, last_name, email) VALUES
(1, 'Akash', 'Kumar', 'akash@example.com'),
(2, 'Rahul', 'Verma', 'rahul@example.com'),
(3, 'Akshay', 'Singh', 'akshay@example.com'),
(4, 'Jordan', 'Smith', 'jordan@example.com'),
(7, 'Taylor', 'Swift', 'taylor@example.com');

-- Insert attendance counts
INSERT INTO attendance (member_id, event_id) VALUES
(1, 1),
(2, 1),
(3, 1), (3, 2),
(4, 1), (4, 2), (4, 3), (4, 4), (4, 5),
(7, 1), (7, 2), (7, 3), (7, 4);

-- ==========================================
-- STEPS 2, 3 & 4: The Multi-CTE Pipeline
-- ==========================================
WITH MemberStats AS (
    SELECT m.member_id, m.first_name, COUNT(a.scan_id) AS total_attended 
    FROM members m 
    INNER JOIN attendance a ON m.member_id = a.member_id 
    GROUP BY m.member_id, m.first_name
),
GlobalAverage AS (
    SELECT AVG(total_attended) FROM MemberStats
)
SELECT member_id, first_name, total_attended 
FROM MemberStats 
WHERE total_attended > (SELECT * FROM GlobalAverage);