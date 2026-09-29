-- 627. Swap Sex of Employees
UPDATE salary 
SET sex  = 
    CASE
        WHEN sex = 'm' THEN 'f'
        ELSE 'm'
    END ;