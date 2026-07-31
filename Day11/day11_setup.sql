/* ========================================== */
/* DAY 11: Categorizing Metrics (GROUP BY)    */
/* ========================================== */

-- 1. Select the database
USE synexus_db;

-- ==========================================
-- STEP 1: Data Alignment & Check
-- ==========================================
SELECT * FROM members;
SELECT * FROM events;
SELECT * FROM attendance;

-- ==========================================
-- STEP 2: Basic Grouping (GROUP BY)
-- ==========================================
SELECT m.designation, COUNT(*) AS member_count 
FROM members m 
GROUP BY m.designation;

-- ==========================================
-- STEP 3: Grouping Across Tables (JOIN + GROUP BY)
-- ==========================================
SELECT e.event_name, COUNT(a.scan_id) AS total_attendees 
FROM events e 
LEFT JOIN attendance a ON e.event_id = a.event_id 
GROUP BY e.event_id, e.event_name;

-- ==========================================
-- STEP 4: Filtering Groups (HAVING)
-- ==========================================
SELECT e.event_name, COUNT(a.scan_id) AS total_attendees 
FROM events e 
LEFT JOIN attendance a ON e.event_id = a.event_id 
GROUP BY e.event_id, e.event_name 
HAVING COUNT(a.scan_id) > 0;