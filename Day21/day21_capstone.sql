/* ========================================== */
/* DAY 21: THE GRAND FINALE CAPSTONE          */
/* ========================================== */

-- 1. Select the database
USE synexus_db;

-- ==========================================
-- STEP 5: The View Encapsulation
-- ==========================================
CREATE OR REPLACE VIEW vw_member_impact_report AS

WITH MemberStats AS (
    SELECT 
            m.member_id,
                    m.first_name,
                            m.last_name,
                                    m.designation,
                                            COUNT(a.scan_id) AS total_events
                                                FROM members m
                                                    LEFT JOIN attendance a ON m.member_id = a.member_id
                                                        GROUP BY m.member_id, m.first_name, m.last_name, m.designation
                                                        ),
                                                        OrgAverage AS (
                                                            SELECT AVG(total_events) FROM MemberStats
                                                            )
                                                            SELECT 
                                                                DENSE_RANK() OVER (ORDER BY total_events DESC) AS impact_rank,
                                                                    UPPER(CONCAT(first_name, ' ', last_name)) AS full_name,
                                                                        COALESCE(designation, 'General Member') AS clean_role,
                                                                            total_events,
                                                                                CASE 
                                                                                        WHEN total_events > (SELECT * FROM OrgAverage) THEN 'High Impact'
                                                                                                ELSE 'Standard'
                                                                                                    END AS engagement_status
                                                                                                    FROM MemberStats;
                                                                                                    