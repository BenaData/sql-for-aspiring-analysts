USE brewtrack;

-- A Subquery is embended inside another query to act like either an input or an output.
-- Subqueries help in executing queries with dependency on the output of another query.
-- MYSQL Subquery can be used with an outer query which is used as input to the outer query.
-- They can be used in SELECT, FROM or WHERE/HAVING clauses
-- When used in the WHERE/HAVING clause, they can be used with any filtering operators.

-- Selecting refunded orders where refund amount is greater than the average refund amount.
-- Here, the subquery is used in the WHERE clause.
-- it is used with the ">" comparison operator.
SELECT *
	FROM raw_refunds
WHERE refund_amount > (
SELECT 
	AVG(refund_amount)
	FROM raw_refunds);

-- We need to select all refunded orders where the reason for refund was caused by firm's actions or inaction.
-- Here we use it in the WHERE clause but with "IN" 
SELECT *
FROM raw_orders
WHERE order_id IN (SELECT order_id
FROM raw_refunds
WHERE reason IN ("quality_issue", "wrong_item", "duplicate_charge"));

-- NOT IN is the oposite of IN
SELECT *
FROM raw_orders
WHERE order_id IN (SELECT order_id
FROM raw_refunds
WHERE reason NOT IN ("quality_issue", "wrong_item", "duplicate_charge"));

-- Finding all orders that were refundedd
SELECT *
FROM raw_orders
WHERE
order_id IN 
(SELECT order_id 
FROM raw_refunds);
-- Finding orders that were not returned
SELECT *
FROM raw_orders
WHERE order_id NOT IN (
SELECT order_id
FROM raw_refunds);


-- Selecting refunded orders where refund amount is greater than the average refund amount while showing the average refund alongside each row
-- Here, the subquery is used in both the SELECT and WHERE clause
SELECT *, (SELECT AVG(refund_amount) FROM raw_refunds) AS average_refund_amount
	FROM raw_refunds
WHERE refund_amount > (
SELECT 
	AVG(refund_amount)
	FROM raw_refunds);
    

    