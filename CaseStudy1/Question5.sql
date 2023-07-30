-- 5. Which item was the most popular for each customer?

--set up cte
WITH items_rank AS (
	        -- Select customer's id, product name
			SELECT customer_id,
				   product_name,
				   total_purchases, --number of times a customer purchases a particular product
			-- rank each item based on how often a customer bought it, account for equal no_ of purchases per item
			DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY total_purchases DESC) AS item_rank --the rank
			--FROM subquery to obtain each customers total purchases based on items/products in the menu
			FROM(
				SELECT s.customer_id,
						product_name,
						COUNT(*) total_purchases
				FROM sales AS s
				INNER JOIN menu AS m
				ON m.product_id = s.product_id
				GROUP BY customer_id, product_name) AS prod_cus_pur)
--main query
   -- select customer_id and product_name
SELECT customer_id,
       product_name AS most_purchased_product
FROM items_rank
-- filter for product(s) that tops the most bought item in the menu by the customer
WHERE item_rank = 1