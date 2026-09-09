TASK 2: SALES AND CUSTOMER ANALYTICS
M. TAmil raj
Simple MySQL Queries

1. COUNT()
SELECT COUNT(*) AS total_sales
FROM Sales;

2. SUM()
SELECT SUM(p.price * s.quantity) AS total_sales_amount
FROM Sales s
JOIN Product p ON s.product_id = p.product_id;

3. AVG()
SELECT AVG(price) AS average_product_price
FROM Product;

4. MIN()
SELECT MIN(price) AS minimum_price
FROM Product;

5. MAX()
SELECT MAX(price) AS maximum_price
FROM Product;

6. Total sales report
SELECT SUM(p.price * s.quantity) AS total_sales
FROM Sales s
JOIN Product p ON s.product_id = p.product_id;

7. Top customers based on purchase amount
SELECT c.customer_name,
       SUM(p.price * s.quantity) AS total_purchase
FROM Customer c
JOIN Sales s ON c.customer_id = s.customer_id
JOIN Product p ON s.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_purchase DESC;

8. Best-selling products
SELECT p.product_name,
       SUM(s.quantity) AS quantity_sold
FROM Product p
JOIN Sales s ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name
ORDER BY quantity_sold DESC;

9. Category-wise sales analysis
SELECT p.category,
       SUM(s.quantity) AS quantity_sold,
       SUM(p.price * s.quantity) AS total_sales
FROM Product p
JOIN Sales s ON p.product_id = s.product_id
GROUP BY p.category
ORDER BY total_sales DESC;
