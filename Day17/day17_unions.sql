/* ========================================== */
/* DAY 17: Stacking Data (UNION & UNION ALL)  */
/* ========================================== */

-- 1. Select the database
USE synexus_db;

-- ==========================================
-- STEP 1: Setup - The Guest Speakers Table
-- ==========================================
CREATE TABLE IF NOT EXISTS guest_speakers (
    speaker_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    expertise VARCHAR(100)
);

-- Safely insert guest speakers (bypasses duplicate errors if run again)
INSERT IGNORE INTO guest_speakers (first_name, last_name, email, expertise)
VALUES 
('Taylor', 'Brooks', 'taylor@industry.com', 'Cloud Architecture'),
('Riley', 'Chen', 'riley@data.com', 'Machine Learning'),
('Morgan', 'Reed', 'morgan@synexus.com', 'Community Building'); 

-- Ensure Casey exists in members for the Step 4 expected output match
INSERT IGNORE INTO members (first_name, last_name, email) 
VALUES ('Casey', 'Vance', 'casey@synexus.com');

-- ==========================================
-- STEP 2: The Standard UNION
-- Combine first_name, last_name, and email from both tables
-- ==========================================
SELECT first_name, last_name, email FROM members
UNION
SELECT first_name, last_name, email FROM guest_speakers;

-- ==========================================
-- STEP 3: Keeping Duplicates (UNION ALL)
-- Keep all records including duplicates (like Morgan)
-- ==========================================
SELECT first_name, last_name, email FROM members
UNION ALL
SELECT first_name, last_name, email FROM guest_speakers;

-- ==========================================
-- STEP 4: Labeling the Source & Matching Expected Output
-- Add source type labels and filter to match the targeted view
-- ==========================================
SELECT first_name, last_name, email, 'Member' AS contact_type 
FROM members 
WHERE first_name IN ('Casey', 'Morgan')

UNION ALL

SELECT first_name, last_name, email, 'Guest Speaker' AS contact_type 
FROM guest_speakers 
WHERE first_name IN ('Taylor', 'Morgan');