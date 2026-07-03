USE brewtrack;

-- WHERE CLAUSE
-- It is used to filter data
-- Using "=" sign
SELECT *
	FROM raw_ad_spend
WHERE channel = "Meta";

-- Using "Not Equal (!=)
SELECT *
	FROM raw_ad_spend
WHERE channel != "Meta";

-- Using Greater than
SELECT month, channel, spend_usd
	FROM raw_ad_spend
WHERE spend_usd > 6500;

-- Using range
SELECT month, channel, spend_usd
	FROM raw_ad_spend
WHERE spend_usd BETWEEN 3500 AND 4000;

-- Using "IN" to retreave the information in a list
SELECT *
	FROM raw_email_events
WHERE campaign IN ("ab_test_landing_v1", "ab_test_landing_v2", "monthly_newsletter");

-- Using "NOT IN" to retreave information  not in the list
SELECT *
	FROM raw_email_events
WHERE campaign NOT IN ("ab_test_landing_v1", "ab_test_landing_v2", "monthly_newsletter");

-- Using LIKE and "%"to filter data based on an entry that starts with a certain letter.
-- used for qualitative enteries
SELECT *
	FROM raw_subscribers
WHERE email LIKE "j%";

-- Using LIKE and "%a" to select data with an entry that contains a certain letters.
SELECT * 
	FROM raw_subscribers
WHERE email LIKE "%me%";

-- Checking Null enteries using "IS NULL"
SELECT *
	FROM raw_subscribers
WHERE email IS NULL;

-- Checking non null values using "IS NOT NULL"
SELECT *
	FROM raw_subscribers
WHERE email IS NOT NULL;


-- Filtering with more than 1 condition using "AND"
SELECT *
	FROM raw_refunds
WHERE refund_amount > 50 AND reason = "quality_issue";

-- Filtering using either of two conditions using "OR"
SELECT *
	FROM raw_refunds
WHERE refund_amount > 50 OR reason = "quality_issue";

-- Filtering on the date column
SELECT *
	FROM raw_refunds
WHERE refund_date > '2024-10-31';

-- Filtering on a date range
SELECT *
	FROM raw_refunds
WHERE refund_date BETWEEN "2024-10-01" AND "2024-10-31";
