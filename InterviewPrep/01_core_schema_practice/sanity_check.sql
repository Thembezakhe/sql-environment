-- Checking the number of records in each table to ensure data integrity
-- and that the relationships between tables are maintained. 

SET search_path TO practice;

SELECT
    COUNT(*) AS users,
    (SELECT COUNT(*) FROM products) AS products,
    (SELECT COUNT(*) FROM orders) AS orders,
    (SELECT COUNT(*) FROM order_items) AS order_items
FROM users;

-- end of file