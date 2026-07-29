/* ========================================== */
/* DAY 9: Inclusive Data (LEFT & RIGHT JOIN)  */
/* ========================================== */

-- 1. Select the database
USE synexus_db;

-- ==========================================
-- STEP 1: Data Check
-- ==========================================
SELECT * FROM members;
SELECT * FROM attendance;

-- ==========================================
-- STEP 2: The LEFT JOIN
-- ==========================================
SELECT m.first_name, m.last_name, a.scanned_at 
FROM members m 
LEFT JOIN attendance a ON m.member_id = a.member_id;

-- ==========================================
-- STEP 3: Finding Inactive Members (The Interview Trick)
-- ==========================================
SELECT m.first_name, m.last_name, a.scanned_at 
FROM members m 
LEFT JOIN attendance a ON m.member_id = a.member_id 
WHERE a.scan_id IS NULL;

-- ==========================================
-- STEP 4: The RIGHT JOIN
-- ==========================================
SELECT e.event_name, a.scanned_at 
FROM attendance a 
RIGHT JOIN events e ON a.event_id = e.event_id;