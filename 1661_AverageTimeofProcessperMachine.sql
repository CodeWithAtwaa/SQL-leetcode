
-- 1661. Average Time of Process per Machine


SELECT 
    f.machine_id,
    ROUND(AVG(s.timestamp-f.timestamp ),3) as processing_time
FROM Activity f
INNER JOIN Activity s
ON f.machine_id = s.machine_id 
AND f.process_id = s.process_id
AND f.activity_type = 'start'
AND s.activity_type = 'end' 
GROUP BY f.machine_id
ORDER BY f.machine_id ASC