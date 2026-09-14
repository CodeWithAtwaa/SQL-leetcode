
-- 176. Second Highest Salary

SELECT (
        SELECT salary
        FROM (
                SELECT id, salary, DENSE_RANK() OVER (
                        ORDER BY salary DESC
                    ) as t
                FROM Employee
            ) tt
        WHERE
            tt.t = 2
    ) as SecondHighestSalary

SELECT (
        SELECT DISTINCT
            salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1
        OFFSET
            1
    ) SecondHighestSalary

SELECT MAX(salary) as SecondHighestSalary
FROM Employee
WHERE
    salary < (
        SELECT MAX(salary)
        FROM Employee
    )