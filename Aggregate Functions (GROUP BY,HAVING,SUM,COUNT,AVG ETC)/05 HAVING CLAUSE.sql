USE brewtrack;

-- HAVING CLAUSE
-- "HAVING" IS USED LIKE "ORDER BY" But it is only used after aggregation.
-- So we can say that 'HAVING' is used together after 'GROUP BY'
SELECT reason, COUNT(order_id) AS Total_orders
	FROM raw_refunds
GROUP BY reason
HAVING Total_orders > 200;

-- Both '	WHERE' and 'HAVING' can be used together.
-- Be careful to use them appropriately.
-- You just need to know that"WHERE" filters data before aggregation while "HAVING" filters after aggregation.
SELECT reason, COUNT(order_id) AS Total_orders
	FROM raw_refunds
WHERE refund_amount > 30
GROUP BY reason
HAVING Total_orders > 100;
