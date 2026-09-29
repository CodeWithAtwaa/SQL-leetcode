-- 1890. The Latest Login in 2020


SELECT 
    user_id,
    MAX(time_stamp) AS last_stamp
FROM Logins
WHERE time_stamp < '2020-12-31 23:59:59'
GROUP BY user_id
HAVING MAX(time_stamp) < '2020-12-31 23:59:59' AND MAX(time_stamp) > '2020-01-01 01:00:00' 




SELECT 
    user_id,
    MAX(time_stamp) as last_stamp
FROM 
        (SELECT 
        user_id,
        time_stamp
        FROM Logins
        WHERE  (time_stamp) < '2020-12-31 23:59:59' AND (time_stamp) > '2020-01-01 01:00:00'
    )t
GROUP BY user_id