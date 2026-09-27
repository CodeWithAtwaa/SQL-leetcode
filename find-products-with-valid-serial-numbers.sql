# Write your MySQL query statement below

SELECT
    *
FROM products
WHERE regexp_like(description,'(^|[^A-Za-z0-9])SN[0-9]{4}-[0-9]{4}([^A-Za-z0-9]|$)','c')
ORDER BY 1