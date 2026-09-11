-- 197. Rising Temperature

SELECT w1.id 
FROM Weather w1
JOIN Weather w2 
ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;



SELECT 
    id
FROM 
(    SELECT  
        id,
        temperature,
        recordDate,
        LAG(temperature) OVER (ORDER BY recordDate ASC) as prev,
        LAG(recordDate) OVER (ORDER BY recordDate ASC) as prev1
    FROM Weather) t
WHERE temperature > prev AND DATEDIFF(recordDate - prev1) = 1