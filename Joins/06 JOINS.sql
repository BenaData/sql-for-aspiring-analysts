USE brewtrack;

-- JOINS are used to query data from two or more tables, or from one table twice.
-- An INNER JOIN returns only rows that math in both tables
SELECT
	o.order_id,
    o.plan_tier,
    o.amount,
    (o.amount- o.cogs) as profit,
    r.refund_id,
    r.reason
FROM raw_orders o
INNER JOIN raw_refunds r 
	ON o.order_id = r.order_id;
    
-- Filtering the data just to practice earlier lessons
SELECT
	o.order_id,
    o.plan_tier,
    o.amount,
    (o.amount- o.cogs) as profit,
    r.refund_id,
    r.reason
FROM raw_orders o
INNER JOIN raw_refunds r 
	ON o.order_id = r.order_id
	HAVING profit > 35;
    
-- A LEFT JOIN retrieves all rows from the left (first) table and only the matching rows from the right (second) table.
-- Raws that are on the left table but are not on the right table get Null values inte right table columns.
SELECT
	r.order_id,
    o.plan_tier,
    o.amount,
    r.reason
FROM raw_orders o
LEFT JOIN raw_refunds r 
	ON o.order_id = r.order_id;

-- RIGHT JOIN is just an opposite of the LEFT JOIN. Here, all raws on the Right table are retreaved.
SELECT
	r.order_id,
    o.plan_tier,
    o.amount,
    r.reason
FROM raw_refunds r
RIGHT JOIN raw_orders o
	ON o.order_id = r.order_id;

-- FULL OUTER JOIN gets all raws from both tables
-- MySQL does not support the "FULL OUTER JOIN" keyword
-- we do it by combining "LEFT JOIN" with "RIGHT JOIN" using 'UNION' or "UNION ALL"
-- UNION checks for duplicates accros the combined data.
-- UNION ALL does not look for duplicates.
-- Therefore, UNION ALL is faster than UNION. Use UNION ALL if you want to optimize query.
SELECT
	*
FROM raw_orders o
LEFT JOIN raw_refunds r
	ON r.order_id = o.order_id

UNION

SELECT *
FROM raw_orders o
RIGHT JOIN raw_refunds r
	ON r.order_id = o.order_id;
    
-- SELF JOIN is when a table is joined with itself.
SELECT 
    t1.subscriber_id,
    t1.campaign AS initial_campaign,
    t2.campaign AS next_campaign
FROM raw_email_events t1
INNER JOIN raw_email_events t2 
    ON t1.subscriber_id = t2.subscriber_id
LIMIT 20;

-- ANTIJOINS are used to select rows that are not in the other table
-- So it returns all rows in one (primary) table that have no matches on the other (secondary) table.
-- We use filters (WHERE()) to do that
-- Using LEFT JOIN + IS NULL
SELECT
	o.order_id,
    o.subscriber_id,
    o.order_date,
    o.plan_tier,
    o.amount,
    o.cogs,
    o.status,
    o.payment_method
FROM raw_orders o
LEFT JOIN raw_refunds r 
	ON o.order_id = r.order_id
WHERE r.order_id IS NULL
LIMIT 5;

-- using NOT EXISTS
SELECT * 
	FROM raw_orders o
WHERE NOT EXISTS (
SELECT r.order_id
FROM raw_refunds r
WHERE o.order_id = r.order_id
)
LIMIT 5;


-- Using NOT IN
SELECT *
	FROM raw_orders
WHERE order_id NOT IN (
SELECT order_id
FROM raw_refunds)
LIMIT 5;


-- All three anti-joins return the same thing.
-- In our marketing data, they returned the orders that were not refunded.
-- They are simply orders that are on the orders table but not on the refunds table.
