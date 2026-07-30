/* ========================================== */
/* DAY 10: Crunching Numbers (Aggregates)     */
/* ========================================== */

-- 1. Select the database
USE synexus_db;

-- ==========================================
-- STEP 1: Setup - The Projects Table
-- ==========================================
CREATE TABLE IF NOT EXISTS projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    budget DECIMAL(10, 2),
    team_size INT
);

INSERT INTO projects (project_name, budget, team_size)
VALUES 
('StoreLane Hyperlocal App', 5000.00, 6),
('Synexus Website V2', 1500.00, 4),
('QR Attendance Tracker', 3000.00, 3),
('Logistics Management System', 5000.00, 8);

-- ==========================================
-- STEP 2: Counting Records (COUNT)
-- ==========================================
SELECT COUNT(*) AS total_members 
FROM members;

-- ==========================================
-- STEP 3: Finding Extremes (MIN & MAX)
-- ==========================================
SELECT MIN(budget) AS lowest_budget, MAX(budget) AS highest_budget 
FROM projects;

-- ==========================================
-- STEP 4: Totals and Averages (SUM & AVG)
-- ==========================================
SELECT SUM(budget) AS total_budget, AVG(team_size) AS average_team_size 
FROM projects;

-- ==========================================
-- STEP 5: The Mini-Dashboard
-- ==========================================
SELECT COUNT(*) AS total_projects, SUM(budget) AS total_budget, AVG(team_size) AS average_team_size 
FROM projects;