SELECT MAX(salary) as SecondHighestSalary
FROM 
    (
        SELECT 
            salary,
            ROW_NUMBER() OVER (ORDER BY salary desc ) as r
        FROM
            (SELECT 
                DISTINCT salary
            FROM Employee) as t
    ) as z
WHERE r = 2;