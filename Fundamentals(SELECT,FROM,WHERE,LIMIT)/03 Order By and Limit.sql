USE brewtrack;

-- The ORDER BY clause is used to sort data either by descending or ascending order
-- Odering by ascending order
SELECT * 
	FROM raw_ad_spend
WHERE new_subscribers_attributed > 2000
ORDER BY spend_usd;

-- Ordering by descending order
SELECT * 
	FROM raw_ad_spend
WHERE new_subscribers_attributed > 2000
ORDER BY spend_usd DESC;

-- Multi-column sort
SELECT * 
	FROM raw_ad_spend
WHERE new_subscribers_attributed > 2000
ORDER BY new_subscribers_attributed DESC, cpm DESC;

-- Selecting only top rows after sorting
SELECT *
	FROM raw_ad_spend
WHERE new_subscribers_attributed > 2000
ORDER BY new_subscribers_attributed
LIMIT 5;

-- paginating/ Skiping some rows and then counting specific number of rows
SELECT *
	FROM raw_ad_spend
WHERE new_subscribers_attributed > 1000
ORDER BY new_subscribers_attributed
LIMIT 5 OFFSET 20;
















