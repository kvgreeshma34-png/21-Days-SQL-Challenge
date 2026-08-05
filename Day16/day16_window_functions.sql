/* ========================================== */
/* DAY 16: Analytical Computations (OVER)     */
/* ========================================== */

-- 1. Select the database
USE synexus_db;

-- ==========================================
-- STEP 1: Setup Projects Data for Expected Output
-- ==========================================
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE projects;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO projects (project_id, project_name, budget) VALUES
(1, 'StoreLane Hyperlocal App', 5000.00),
(2, 'Logistics Management System', 5000.00),
(3, 'QR Attendance Tracker', 3000.00),
(4, 'Synexus Website V2', 1500.00);

-- ==========================================
-- STEP 2: Sequential Numbering (ROW_NUMBER)
-- Write a query selecting project_name and budget from the 'projects' table.
-- Add an analytical column that generates a sequential row number 
-- ordered by budget DESC.
-- ==========================================
SELECT 
    ROW_NUMBER() OVER (ORDER BY budget DESC) AS project_rank_id,
    project_name, 
    budget 
FROM projects;

-- ==========================================
-- STEP 3: Cumulative Analytics (Running Total)
-- Write a query to select project_name and budget.
-- Create a running total column using SUM(budget) OVER (ORDER BY project_id ASC).
-- Alias this new analytical column as 'running_total_budget'.
-- ==========================================
SELECT 
    project_name, 
    budget, 
    SUM(budget) OVER (ORDER BY project_id ASC) AS running_total_budget 
FROM projects;