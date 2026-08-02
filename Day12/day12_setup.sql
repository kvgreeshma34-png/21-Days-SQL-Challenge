/* ========================================== */
/* DAY 12: Nested Logic (Subqueries)          */
/* ========================================== */

-- 1. Select the database
USE synexus_db;

-- ==========================================
-- STEP 1: Data Alignment & Check
-- ==========================================
SELECT * FROM members;
SELECT * FROM projects;
SELECT * FROM attendance;

-- ==========================================
-- STEP 2: The Scalar Subquery
-- Question: Which projects have a budget HIGHER than the average budget?
-- ==========================================
SELECT project_name, budget 
FROM projects 
WHERE budget > (SELECT AVG(budget) FROM projects);

-- ==========================================
-- STEP 3: The List Subquery (IN)
-- Question: Who are the members that have attended at least one event?
-- ==========================================
SELECT m.first_name, m.last_name 
FROM members m 
WHERE m.member_id IN (SELECT a.member_id FROM attendance a);