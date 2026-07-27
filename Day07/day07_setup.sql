/* ========================================== */
/* DAY 7: Data Relationships & Foreign Keys   */
/* ========================================== */

-- 1. Select the database
USE synexus_db;

-- ==========================================
-- STEP 2 & 3: Architect the Attendance Table
-- ==========================================
CREATE TABLE attendance (
    scan_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    event_id INT NOT NULL,
    scanned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- ==========================================
-- STEP 4: Test Referential Integrity
-- ==========================================
SELECT member_id, first_name FROM members;
SELECT event_id, event_name FROM events;

-- Insert a valid attendance record
INSERT INTO attendance (member_id, event_id) 
VALUES (1, 1);

-- ==========================================
-- BONUS: The Integrity Crash (Intentional Error)
-- ==========================================
-- Try inserting an attendance record using a member_id that does not exist.
-- MySQL will block this and throw a Foreign Key constraint error!
INSERT INTO attendance (member_id, event_id) 
VALUES (9999, 1);