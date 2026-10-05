
-- 608. Tree Node

SELECT
    id , 
    CASE 
        WHEN p_id IS NULL THEN 'Root'
        WHEN id IN (SELECT 
                DISTINCT i.id 
                from Tree i
                JOIN Tree j
                ON i.id = j.p_id) THEN 'Inner'
        ELSE 'Leaf'
    END as type
FROM Tree