-- 3. What was the first item from the menu purchased by each customer?

WITH first_order AS (SELECT customer_id,
                            MIN(order_date) AS first_order_date
                     FROM sales AS s
				     INNER JOIN menu AS m
					 ON m.product_id = s.product_id
					 GROUP BY customer_id)
SELECT DISTINCT s.customer_id,
	   product_name AS first_order 
FROM first_order AS f
INNER JOIN sales AS s
ON s.customer_id = f.customer_id AND
   s.order_date = f.first_order_date
INNER JOIN menu AS m
ON m.product_id = s.product_id
