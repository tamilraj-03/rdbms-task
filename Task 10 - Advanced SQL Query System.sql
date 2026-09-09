TASK 3: ADVANCED SQL QUERY SYSTEM
M. Tamil raj
Simple MySQL Queries

1. Products above the average price
SELECT product_name, price
FROM Product
WHERE price > (SELECT AVG(price) FROM Product);

2. Customer with maximum purchase amount
SELECT c.customer_name,
       SUM(p.price * s.quantity) AS total_purchase
FROM Customer c
JOIN Sales s ON c.customer_id = s.customer_id
JOIN Product p ON s.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_purchase DESC
LIMIT 1;

3. Customers who spent more than the average customer
SELECT c.customer_name,
       SUM(p.price * s.quantity) AS total_purchase
FROM Customer c
JOIN Sales s ON c.customer_id = s.customer_id
JOIN Product p ON s.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
HAVING total_purchase > (
    SELECT AVG(customer_total)
    FROM (
        SELECT SUM(p2.price * s2.quantity) AS customer_total
        FROM Sales s2
        JOIN Product p2 ON s2.product_id = p2.product_id
        GROUP BY s2.customer_id
    ) AS totals
);

4. Products that have never been sold
SELECT product_name
FROM Product
WHERE product_id NOT IN (
    SELECT product_id
    FROM Sales
);

5. Customers who purchased Electronics products
SELECT DISTINCT customer_name
FROM Customer
WHERE customer_id IN (
    SELECT s.customer_id
    FROM Sales s
    JOIN Product p ON s.product_id = p.product_id
    WHERE p.category = 'Electronics'
);

6. Highest-priced product
SELECT product_name, price
FROM Product
WHERE price = (SELECT MAX(price) FROM Product);
