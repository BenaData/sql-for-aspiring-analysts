USE brewtrack;
-- DATE FUNCTIONS
-- They are used to retreive, manipulate, format or calculate date values.
-- DATE() funtion extracts day from a datetime expression
SELECT DATE(order_date)
FROM raw_orders
Limit 5;

-- YEAR() Is used to extract the year
SELECT 
	order_date,
    YEAR(order_date) AS order_year
FROM raw_orders
LIMIT 5;

-- MONTH() is used to extract the month from a date variable
-- It extracts month as a number; 1 for January, 2 for February, etc.
SELECT 
	order_date,
    MONTH(order_date) AS order_month
FROM raw_orders
LIMIT 5;

-- MONTHNAME() is used to extract month as a name
SELECT 
	order_date,
    MONTHNAME(order_date) AS order_month_name
FROM raw_orders
LIMIT 5;

-- DAY() is used to etract day of the month from a date variable
SELECT 
	order_date,
    DAY(order_date) AS order_day_of_month
FROM raw_orders
LIMIT 5;

-- WEEK() is used to extract the week of the year.
-- There are 52 weeks in a year
SELECT 
	order_date,
    WEEK(order_date) AS order_week_of_year
FROM raw_orders
LIMIT 5;

-- QUARTER() is used to extract the quarter of the year.
-- A year has 4 quarters.
-- Each quarter has 3 months
SELECT 
	order_date,
    QUARTER(order_date) AS Quarter
FROM raw_orders
LIMIT 5;

-- Here are all the above funtions in one query
SELECT
	order_date,
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    MONTHNAME(order_date) AS month_name,
    DAY(order_date) AS order_day_of_month,
    WEEK(order_date) AS order_week,
    QUARTER(order_date) AS order_quarter
FROM raw_orders;
