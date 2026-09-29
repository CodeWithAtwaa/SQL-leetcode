-- 1407. Top Travellers


SELECT
    u.name,
    IFNULL(SUM(d.distance) , 0) as travelled_distance
FROM Users u
LEFT JOIN Rides d
on u.id = d.user_id
GROUP BY u.name, u.id
ORDER BY travelled_distance DESC, u.name ASC  