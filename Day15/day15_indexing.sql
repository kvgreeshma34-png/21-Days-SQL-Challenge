/* ========================================== */
/* DAY 15: Optimizing Performance (Indexing)  */
/* ========================================== */

-- 1. Select the database
USE synexus_db;

-- ==========================================
-- STEP 2: Peek Under the Hood (EXPLAIN)
-- ==========================================
EXPLAIN SELECT * FROM members WHERE email = 'akash@example.com';

-- ==========================================
-- STEP 3: Create the Index 
-- (Drop it first if it already exists from a previous run)
-- ==========================================
DROP INDEX idx_members_email ON members;
CREATE INDEX idx_members_email ON members (email);

-- ==========================================
-- STEP 4: Verify the Optimization
-- ==========================================
EXPLAIN SELECT * FROM members WHERE email = 'akash@example.com';