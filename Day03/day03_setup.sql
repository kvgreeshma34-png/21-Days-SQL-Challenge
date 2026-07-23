/* ========================================== */
/* DAY 3: Updating and Deleting Data          */
/* Project: Synexus Database                  */
/* ========================================== */

USE synexus_db;

-- ==========================================
-- 1. ADDING TEST DATA
-- Add test records to safely modify and delete.
-- ==========================================
INSERT INTO members (first_name, last_name, email, designation) 
VALUES ('Alex', 'Turner', 'alex.test@synexus.com', 'Member');

INSERT INTO events (event_name, event_date, location)
VALUES ('Temporary Test Event', '2026-12-31', 'Room 101');

-- Verify test data before changing it
SELECT * FROM members WHERE first_name = 'Alex';
SELECT * FROM events WHERE event_name = 'Temporary Test Event';

-- ==========================================
-- 2. UPDATING DATA (The 'U' in CRUD)
-- Scenario: Alex Turner got promoted to 'Lead Developer'
-- ==========================================
-- Temporarily disable Safe Updates if you encounter Error 1175
SET SQL_SAFE_UPDATES = 0;

UPDATE members 
SET designation = 'Lead Developer'
WHERE first_name = 'Alex' AND last_name = 'Turner';

-- Verify the update
SELECT * FROM members WHERE first_name = 'Alex';

-- ==========================================
-- 3. DELETING DATA (The 'D' in CRUD)
-- Scenario: The temporary test event got cancelled.
-- ==========================================
DELETE FROM events
WHERE event_name = 'Temporary Test Event';

-- Verify deletion (Should return an empty result)
SELECT * FROM events WHERE event_name = 'Temporary Test Event';

-- Re-enable Safe Updates
SET SQL_SAFE_UPDATES = 1;