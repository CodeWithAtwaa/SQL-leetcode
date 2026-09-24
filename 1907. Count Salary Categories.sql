


SELECT 
    'Low Salary' As category,
     IFNULL(COUNT(income), 0) as accounts_count
FROM Accounts
WHERE
    income < 20000
UNION ALL
SELECT 'Average Salary' As category, COALESCE(COUNT(income), 0) as accounts_count
FROM Accounts
WHERE
    income >= 20000
    AND income <= 50000
UNION ALL
SELECT 'High Salary' AS category, COALESCE(COUNT(income), 0) as accounts_count
FROM Accounts
WHERE
    income > 50000