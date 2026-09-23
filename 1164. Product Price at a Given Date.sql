--  1164. Product Price at a Given Date

SELECT p.product_id, IFNULL(t.new_price, 10) AS price
FROM (
        SELECT DISTINCT
            product_id
        FROM Products
    ) p
    LEFT JOIN (
        SELECT product_id, new_price, ROW_NUMBER() OVER (
                PARTITION BY
                    product_id
                ORDER BY change_date DESC
            ) AS ran
        FROM Products
        WHERE
            change_date <= '2019-08-16'
    ) t On p.product_id = t.product_id
    AND t.ran = 1