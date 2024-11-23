-- Create the Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Create the Sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10, 2),
    region VARCHAR(50),
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert data into the Products table
INSERT INTO products (product_id, product_name, price)
VALUES 
(1, 'Laptop', 10000),
(2, 'Smartphone', 8000),
(3, 'Headphones', 500),
(4, 'Monitor', 3000),
(5, 'Keyboard', 500),
(6, 'Mouse', 150),
(7, 'Printer', 5000),
(8, 'Tablet', 3000);

-- Insert data into the Sales table
INSERT INTO sales (sale_id, product_id, quantity, total_amount, region, sale_date)
VALUES 
(1, 1, 5, 50000, 'North', '2023-01-15'),
(2, 2, 10, 80000, 'East', '2023-02-20'),
(3, 3, 25, 12500, 'South', '2023-03-05'),
(4, 4, 7, 21000, 'West', '2023-04-10'),
(5, 5, 15, 7500, 'North', '2023-05-12'),
(6, 6, 30, 4500, 'East', '2023-06-15'),
(7, 7, 3, 15000, 'South', '2023-07-18'),
(8, 8, 8, 24000, 'West', '2023-08-22'),
(9, 1, 4, 40000, 'North', '2023-09-10'),
(10, 2, 12, 96000, 'East', '2023-10-12'),
(11, 3, 18, 9000, 'South', '2023-11-14'),
(12, 4, 9, 27000, 'West', '2023-12-01');

-- Sales summary by product with total quantity sold and sales amount
SELECT p.product_name, SUM(s.quantity) AS total_quantity_sold, SUM(s.total_amount) AS total_sales
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;

-- Find the top-selling product in each region
SELECT region, p.product_name, MAX(s.total_amount) AS top_sales_amount
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY region, p.product_name
ORDER BY region, top_sales_amount DESC;

-- Total sales quantity and revenue by region
SELECT region, SUM(quantity) AS total_quantity_sold, SUM(total_amount) AS total_revenue
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;

-- Sales within a specific time period (Q1 2023)
SELECT p.product_name, s.quantity, s.total_amount, s.sale_date
FROM sales s
JOIN products p ON s.product_id = p.product_id
WHERE s.sale_date BETWEEN '2023-01-01' AND '2023-03-31'
ORDER BY s.sale_date;

-- Calculate average sale price per product
SELECT p.product_name, AVG(s.total_amount / s.quantity) AS avg_sale_price
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name;
