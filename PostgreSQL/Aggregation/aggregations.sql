-- Create Schema sales_sc
CREATE SCHEMA sales_sc;

-- Create Sales Table
CREATE TABLE sales_sc.sales (
    sale_id SERIAL PRIMARY KEY,
    sale_date DATE NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL
);
-- Insert Data into Sales Table
INSERT INTO sales_sc.sales (sale_date, product_name, quantity, unit_price) VALUES
('2024-08-01', 'Product A', 10, 15.00),
('2024-08-01', 'Product B', 5, 25.00),
('2024-08-02', 'Product A', 8, 15.00),
('2024-08-02', 'Product C', 12, 10.00),
('2024-08-03', 'Product B', 7, 25.00),
('2024-08-03', 'Product C', 5, 10.00),
('2024-08-03', 'Product A', 6, 15.00);


-- Aggregation Functions:
    -- COUNT: Counts the number of rows in the table.
        SELECT COUNT(*) AS total_sales
        FROM sales_sc.sales;

    -- SUM: Calculates the total revenue by summing the product of quantity and unit_price.
        SELECT SUM(quantity * unit_price) AS total_revenue
        FROM sales_sc.sales;

    -- AVG: Finds the average quantity sold per sale.
        SELECT AVG(quantity) AS avg_quantity
        FROM sales_sc.sales;

    -- MAX: Identifies the maximum quantity sold in a single transaction.
        SELECT MAX(quantity) AS max_quantity
        FROM sales_sc.sales; 

    -- MIN: Determines the minimum unit price of products sold.
        SELECT MIN(unit_price) AS min_price
        FROM sales_sc.sales;

    -- GROUP BY: Groups rows sharing the same value for product_name and calculates aggregate values for each group.
        SELECT product_name,
        SUM(quantity * unit_price) AS total_revenue,
        AVG(quantity) AS avg_quantity
        FROM sales_sc.sales
        GROUP BY product_name;

    -- HAVING: Filters groups based on aggregated results.
        SELECT product_name,
        SUM(quantity * unit_price) AS total_revenue
        FROM sales_sc.sales
        GROUP BY product_name
        HAVING SUM(quantity * unit_price) > 100;
