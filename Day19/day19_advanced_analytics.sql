USE synexus_db;
INSERT INTO projects (project_id, project_name, budget)
VALUES (1, 'Synexus Hyperlocal App', 5000.00)
ON DUPLICATE KEY UPDATE budget = 5000.00;

INSERT INTO projects (project_id, project_name, budget)
VALUES (2, 'Logistics Management System', 5000.00)
ON DUPLICATE KEY UPDATE budget = 5000.00;

SELECT 
    project_name, 
    budget,
    ROW_NUMBER() OVER (ORDER BY budget DESC) AS row_number_val,
    RANK() OVER (ORDER BY budget DESC) AS rank_val,
    DENSE_RANK() OVER (ORDER BY budget DESC) AS dense_rank_val
FROM projects;
SELECT 
    project_name, 
    budget,
    LAG(budget) OVER (ORDER BY budget DESC) AS previous_higher_budget
FROM projects;