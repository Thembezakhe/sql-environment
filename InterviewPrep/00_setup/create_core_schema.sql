-- Core Interview Schema
-- This schema is reused across the majority of SQL interview practice.
-- Designed to support joins, aggregation, subqueries, and window functions.

BEGIN;

CREATE SCHEMA IF NOT EXISTS practice;
SET search_path TO practice;

CREATE TABLE users (
    user_id      SERIAL PRIMARY KEY,
    full_name    TEXT NOT NULL,
    email        TEXT UNIQUE,
    signup_date  DATE NOT NULL,
    country      TEXT
);

CREATE TABLE products (
    product_id    SERIAL PRIMARY KEY,
    product_name  TEXT NOT NULL,
    category      TEXT,
    price         NUMERIC(10,2) NOT NULL CHECK (price >= 0)
);

CREATE TABLE orders (
    order_id    SERIAL PRIMARY KEY,
    user_id     INT NOT NULL,
    order_date  DATE NOT NULL,
    status      TEXT NOT NULL,
    
    CONSTRAINT fk_orders_user
        FOREIGN KEY (user_id)
        REFERENCES users (user_id)
);

CREATE TABLE order_items (
    order_item_id  SERIAL PRIMARY KEY,
    order_id       INT NOT NULL,
    product_id     INT NOT NULL,
    quantity       INT NOT NULL CHECK (quantity > 0),
    unit_price     NUMERIC(10,2) NOT NULL CHECK (unit_price >= 0),

    CONSTRAINT fk_items_order
        FOREIGN KEY (order_id)
        REFERENCES orders (order_id),

    CONSTRAINT fk_items_product
        FOREIGN KEY (product_id)
        REFERENCES products (product_id),

    CONSTRAINT uq_order_product
        UNIQUE (order_id, product_id)
);

CREATE INDEX idx_orders_user_id
    ON orders (user_id);

CREATE INDEX idx_orders_order_date
    ON orders (order_date);

CREATE INDEX idx_order_items_product_id
    ON order_items (product_id);

COMMIT;

-- End of create_core_schema.sql