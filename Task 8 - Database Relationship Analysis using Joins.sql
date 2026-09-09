TASK 1: DATABASE RELATIONSHIP ANALYSIS USING JOINS
M. Tamil raj
Simple MySQL Queries

1. INNER JOIN: Complete order details
SELECT c.customer_name, p.product_name, o.order_date, o.quantity, pay.amount
FROM Customer c
INNER JOIN `Order` o ON c.customer_id = o.customer_id
INNER JOIN Product p ON o.product_id = p.product_id
INNER JOIN Payment pay ON o.order_id = pay.order_id;

2. LEFT JOIN: All customers and their orders
SELECT c.customer_name, o.order_id, o.order_date, p.product_name, o.quantity
FROM Customer c
LEFT JOIN `Order` o ON c.customer_id = o.customer_id
LEFT JOIN Product p ON o.product_id = p.product_id;

3. RIGHT JOIN: All products and their orders
SELECT p.product_name, o.order_id, o.order_date, o.quantity
FROM `Order` o
RIGHT JOIN Product p ON o.product_id = p.product_id;

4. Customer purchase history
SELECT c.customer_name, o.order_id, p.product_name, o.quantity, p.price
FROM Customer c
JOIN `Order` o ON c.customer_id = o.customer_id
JOIN Product p ON o.product_id = p.product_id
ORDER BY c.customer_name;

5. Multi-table report
SELECT o.order_id, c.customer_name, p.product_name,
       p.category, o.quantity, pay.amount, pay.payment_status
FROM `Order` o
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Product p ON o.product_id = p.product_id
JOIN Payment pay ON o.order_id = pay.order_id;
