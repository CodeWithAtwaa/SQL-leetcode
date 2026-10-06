-- 3586. Find COVID Recovery Patients

# Write your MySQL query statement below

/*

SELECT 
    patient_id,
    max(test_date) as dat
FROM covid_tests
WHERE result = 'Positive'
GROUP BY patient_id
ORDER BY patient_id,  test_date DESC

| patient_id | dat        |
| ---------- | ---------- |
| 1          | 2023-01-15 |
| 2          | 2023-02-01 |
| 3          | 2023-02-10 |
| 4          | 2023-01-18 |

| patient_id | dat        |
| ---------- | ---------- |
| 1          | 2023-01-25 |
| 2          | 2023-02-12 |
| 3          | 2023-02-20 |
| 5          | 2023-02-20 |

SELECT 
    patient_id,
    max(test_date) as dat
FROM covid_tests
WHERE result = 'Negative'
GROUP BY patient_id
ORDER BY patient_id,  test_date DESC

| patient_id | dat        | dat        |
| ---------- | ---------- | ---------- |
| 1          | 2023-01-15 | 2023-01-25 |
| 2          | 2023-02-01 | 2023-02-12 |
| 3          | 2023-02-10 | 2023-02-20 |
*/


SELECT 
    c.patient_id ,
    p.patient_name,
    p.age,
    DATEDIFF(Min(c1.test_date),MIN(c.test_date)) AS recovery_time 
FROM   covid_tests c 
JOIN covid_tests c1
ON c.patient_id = c1.patient_id
    AND c.test_date < c1.test_date
    AND c.result = 'Positive' 
    AND c1.result = 'Negative' 
JOIN patients p 
ON  p.patient_id = c.patient_id 
GROUP BY p.patient_id 
ORDER BY recovery_time ,patient_name ;