USE brewtrack;

-- Aggregate funions perform calculations on a set of values from multiple rows and returns a single summarized value.
-- COUNT * - It helps us count all rows in the table including rows with null values
SELECT COUNT(*)
	FROM raw_orders;

-- COUNT(column) - It helps us count all nun null values in a column
SELECT COUNT(order_id)
	FROM raw_orders;
    
-- COUNT(DISTINCT column) -It helps count all unique values in a column
SELECT COUNT(DISTINCT plan_tier)
	FROM raw_orders;

-- SUM function is used to add values in a column
SELECT SUM(amount) AS total_sales
	FROM raw_orders;

-- AVG funtion calculates the average in a column
SELECT AVG(cogs) AS Average_COGS
	FROM raw_orders;
    
-- MIN function finds the minimum value in a column
SELECT MIN(cogs) AS minimum_COGS
	FROM raw_orders;

-- MAX finds the maximum value in a column
SELECT MAX(cogs) AS maximum_COGS
	FROM raw_orders;

-- a GROUP BY clause is used to classify these values based on the aggregates.
-- GROUP BY is equivalent to a PIVOT TABLE in Excel
-- The code below calculates the number of orders per plan_tier
SELECT plan_tier, COUNT(order_id) AS "No of Orders"
	FROM raw_orders
GROUP BY plan_tier
ORDER BY COUNT(order_id) DESC;


-- The script below calculates the total amount per payment_method starting with the method with the highest total amount.
SELECT payment_method, SUM(amount) AS "Total Sales"
	FROM raw_orders
GROUP BY payment_method
ORDER BY SUM(amount) DESC;

-- The script below shows payment methods classified by total sales, total number of orders and average sales
SELECT payment_method, SUM(amount) AS total_sales_value, COUNT(order_id) AS No_of_orders, AVG(amount) AS average_sales_value
	FROM raw_orders
GROUP BY payment_method
ORDER BY no_of_orders DESC;

-- The scrip below aggregates the data by plan_tier and payment_method 
SELECT plan_tier, payment_method, SUM(cogs) AS Total_Cost
	FROM raw_orders
GROUP BY plan_tier, payment_method
ORDER BY plan_tier, Total_cost DESC;

