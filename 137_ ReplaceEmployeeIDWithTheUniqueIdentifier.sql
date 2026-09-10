-- 1378. Replace Employee ID With The Unique Identifier

-- 1378. Replace Employee ID With The Unique Identifier

SELECT 
   CASE 
        WHEN u.unique_id IS NOT NULL THEN u.unique_id 
        ELSE NULL
    END  as unique_id
    ,
    e.name
FROM Employees e
LEFT JOIN EmployeeUNI u
ON e.id = u.id


-- 1378. Replace Employee ID With The Unique Identifier

SELECT 
     unique_id,
    e.name
FROM Employees e
LEFT JOIN EmployeeUNI u
ON e.id = u.id