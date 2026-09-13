-- 570. Managers with at Least 5 Direct Reports


SELECT
    e.name
FROM Employee e 
INNER JOIN Employee d
ON e.id = d.managerID
GROUP BY e.id,e.name
HAVING COUNT(d.managerId) >= 5

/*
================================    A    B  =================================
================================  man    emp ================================
+-----+-------+------------+-----------+ +-----+-------+------------+-----------+
| id  | name  | department | managerId | | id  | name  | department | managerId |
+-----+-------+------------+-----------+ +-----+-------+------------+-----------+
| 101 | John  | A          | null      | | 101 | John  | A          | null      |
| 102 | Dan   | A          | 101       | | 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       | | 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       | | 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       | | 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       | | 106 | Ron   | B          | 101       |
+-----+-------+------------+-----------+ +-----+-------+------------+-----------+

*/