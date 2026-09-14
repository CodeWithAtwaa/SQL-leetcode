
-- DELETE FROM Person
-- WHERE id NOT IN (
--     SELECT id FROM 
--         (    SELECT  
--                 MIN(id) as id
--             FROM Person
--             GROUP BY email) t
-- );


DELETE p1
FROM Person p1 
INNER JOIN Person p2
on p1.email = p2.email
AND p1.id > p2.id