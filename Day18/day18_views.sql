/* ========================================== */
/* DAY 18: Query Encapsulation (Views)        */
/* ========================================== */

-- 1. Select the database
USE synexus_db;

-- ==========================================
-- SETUP: Ensure tables and records exist so the view works smoothly
-- ==========================================
CREATE TABLE IF NOT EXISTS guest_speakers (
    speaker_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    expertise VARCHAR(100)
);

INSERT IGNORE INTO guest_speakers (first_name, last_name, email, expertise)
VALUES 
('Taylor', 'Brooks', 'taylor@industry.com', 'Cloud Architecture'),
('Riley', 'Chen', 'riley@data.com', 'Machine Learning'),
('Morgan', 'Reed', 'morgan@synexus.com', 'Community Building'); 

INSERT IGNORE INTO members (first_name, last_name, email) 
VALUES ('Casey', 'Vance', 'casey@synexus.com');

-- ==========================================
-- STEP 2: Create the View
-- Use CREATE OR REPLACE VIEW to safely build 'vw_master_contact_list'.
-- ==========================================
CREATE OR REPLACE VIEW vw_master_contact_list AS
SELECT first_name, last_name, email, 'Member' AS contact_type 
FROM members 
WHERE first_name IN ('Casey', 'Morgan')

UNION ALL

SELECT first_name, last_name, email, 'Guest Speaker' AS contact_type 
FROM guest_speakers 
WHERE first_name IN ('Taylor', 'Morgan');

-- ==========================================
-- STEP 3: Querying the View
-- Treat the view just like a normal table using SELECT *
-- ==========================================
SELECT * FROM vw_master_contact_list;

-- ==========================================
-- STEP 4: Filtering the View
-- Apply a WHERE clause to query only the 'Guest Speaker' rows
-- ==========================================
SELECT * FROM vw_master_contact_list 
WHERE contact_type = 'Guest Speaker';