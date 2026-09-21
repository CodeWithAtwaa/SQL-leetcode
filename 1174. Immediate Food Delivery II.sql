--  1174. Immediate Food Delivery II

# Write your MySQL query statement below

-- SELECT

--     as immediate_percentage
-- FROM Delivery
-- GROUP BY customer_id

-- ROUND( ,2) AS immediate_percentage
--

-- SELECT ROUND(
--         (
--             SUM(
--                 CASE
--                     WHEN t.order_date = d.customer_pref_delivery_date THEN 1
--                     ELSE 0
--                 END
--             ) / count(*)
--         ) * 100, 2
--     ) as immediate_percentage
-- FROM (
--         SELECT
--             delivery_id, customer_id, MIN(order_date) as order_date
--         FROM Delivery
--         GROUP BY
--             customer_id
--     ) AS t
--     JOIN Delivery d ON t.delivery_id = d.delivery_id

SELECT ROUND(
        (
            SUM(
                CASE
                    WHEN d.order_date = d.customer_pref_delivery_date THEN 1
                    ELSE 0
                END
            ) / count(*)
        ) * 100, 2
    ) as immediate_percentage
FROM Delivery d
    JOIN (
        SELECT customer_id, MIN(order_date) as order_date
        FROM Delivery
        GROUP BY
            customer_id
    ) AS t ON d.customer_id = t.customer_id
    AND d.order_date = t.order_date;