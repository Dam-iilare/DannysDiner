-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?

SELECT TOP(1) m.product_name, COUNT(*) total_purchases
FROM sales AS s
INNER JOIN menu AS m
ON m.product_id = s.product_id
GROUP BY m.product_name
ORDER BY 2 DESC;
