--Superstore Analysis

-- Tables 

SHOW TABLES;

-- Describing Each Table

DESCRIBE customers;

DESCRIBE products;

DESCRIBE orders;

-- Total Entries in Tables

SELECT * FROM customers;

 SELECT * FROM products;

 SELECT * FROM orders;

-- Total Customers from  California State 

SELECT * FROM customers WHERE state ='California';

-- Total Technology products

 SELECT * FROM products WHERE category ='Technology';

-- Total Sales by First Class ship mode

SELECT * FROM orders WHERE ship_mode ='First Class';

--Total sales by category

 SELECT p.category, SUM(o.sales) AS total_sales FROM orders o  JOIN products p ON o.product_id =p.product_id GROUP BY p.category;

-- Get customer names and their corresponding orders

 SELECT c.customer_name ,o.order_id,o.order_date FROM customers c JOIN orders o on c.customer_id=o.customer_id;

-- Top 5 Best selling products on profit 
 
SELECT p.product_name,SUM(o.profit) AS total_profit FROM orders o JOIN products p ON o.product_id=p.product_id GROUP BY p.product_name ORDER BY total_profit DESC LIMIT 5;

-- Monthly sales report
 
SELECT DATE_FORMAT(order_date,'%Y-%m') AS month, SUM(sales) AS total_sales FROM orders GROUP BY DATE_FORMAT(order_date,'%Y-%m') ORDER BY month;

-- Total Sales by sub-category
 SELECT p.sub_category,SUM(o.sales) AS total_sales FROM orders o JOIN products p ON o.product_id=p.product_id GROUP BY p.sub_category ORDER BY total_sales DESC;

-- Top 5 customers by total sales
 
SELECT c.customer_name,SUM(o.sales) AS total_sales FROM orders o JOIN customers c ON c.customer_id=o.customer_id GROUP BY c.customer_name ORDER BY total_sales DESC LIMIT 5;

-- Region-wise Sales
 
SELECT c.region,SUM(o.sales) AS total_sales FROM orders o JOIN customers c ON c.customer_id=o.customer_id GROUP BY c.region ORDER BY total_sales DESC LIMIT 5;

-- Top 10 city sales

SELECT c.city,SUM(o.sales) AS total_sales FROM orders o JOIN customers c ON c.customer_id=o.customer_id GROUP BY c.city ORDER BY total_sales DESC LIMIT 10;

-- Top 5 states by profit

 SELECT c.state,SUM(o.profit) AS total_profit FROM orders o JOIN customers c ON c.customer_id=o.customer_id GROUP BY c.state ORDER BY total_profit DESC LIMIT 5;

-- Average discount given by category

 SELECT p.category,AVG(o.discount) AS average_discount FROM orders o JOIN products p ON o.product_id=p.product_id GROUP BY p.category ORDER BY average_discount DESC;

-- Customers who bought  more than 2 or more items in single order

 SELECT c.customer_name,SUM(o.quantity) AS total_quantity FROM orders o JOIN customers c ON c.customer_id=o.customer_id GROUP BY c.customer_name HAVING  total_quantity>=2;

-- Total orders for ship modes
SELECT ship_mode,count(order_id) AS total_orders FROM orders GROUP BY ship_mode ORDER BY total_orders DESC;

-- Top ship mode used

SELECT ship_mode,count(order_id) AS total_orders FROM orders GROUP BY ship_mode ORDER BY total_orders DESC LIMIT 1;

-- Category wise Percentage 

 SELECT p.category,SUM(o.profit)/SUM(o.sales)*100 AS profit_percentage FROM orders o JOIN products p ON o.product_id=p.product_id GROUP BY p.category ORDER BY profit_percentage DESC;

-- Best and worst performing regions (by profit)

 SELECT c.region,SUM(o.profit) AS total_profit FROM orders o JOIN customers c on c.customer_id=o.customer_id GROUP BY c.region ORDER BY total_profit DESC;

-- Most days taken for deliveries (top 5)
 
SELECT order_id,DATEDIFF(ship_date,order_date) AS delivery_days FROM orders ORDER BY delivery_days DESC LIMIT 5;

