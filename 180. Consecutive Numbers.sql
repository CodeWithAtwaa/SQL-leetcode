-- 180. Consecutive Numbers

SELECT DISTINCT
    num as ConsecutiveNums
FROM (
        SELECT num, LEAD(num, 1) OVER (
                ORDER BY id
            ) as next, LAG(num, 1) OVER (
                ORDER BY id
            ) as prev
        FROM Logs
    ) t
WHERE
    num = next
    AND num = prev