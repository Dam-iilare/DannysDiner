-- 1. What is the total amount each customer spent at the restaurant?
SELECT customer_id, SUM(price) AS total_amt_spent
FROM sales AS s
INNER JOIN menu AS m
ON m.product_id = s.product_id
GROUP BY customer_id;