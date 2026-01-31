-- Seed data for core interview schema
-- Includes edge cases for joins, aggregation, NULL handling, and window functions

BEGIN;

SET search_path TO practice;

INSERT INTO users (full_name, email, signup_date, country) VALUES
('Alice Smith',  'alice@mail.com',   '2023-01-05', 'ZA'),
('Bob Jones',    'bob@mail.com',     '2023-01-20', 'ZA'),
('Charlie Brown','charlie@mail.com', '2023-02-01', 'UK'),
('Diana Prince', 'diana@mail.com',   '2023-02-15', 'US'),
('Evan Wright',  NULL,               '2023-03-01', NULL);

INSERT INTO products (product_name, category, price) VALUES
('Laptop',  'Electronics', 15000),
('Mouse',   'Electronics', 300),
('Keyboard','Electronics', 800),
('Desk',    'Furniture',   2500),
('Chair',   'Furniture',   1800),
('Notebook',NULL,          50);

INSERT INTO orders (user_id, order_date, status) VALUES
(1, '2023-02-01', 'completed'),
(1, '2023-03-01', 'completed'),
(2, '2023-03-10', 'cancelled'),
(3, '2023-03-15', 'completed'),
(3, '2023-04-01', 'completed');

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 15000),
(1, 2, 2, 300),
(2, 2, 1, 300),
(2, 3, 1, 800),
(4, 4, 1, 2500),
(5, 5, 2, 1800);

COMMIT;
-- End of seed_core_data.sql