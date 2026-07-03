USE brewtrack;

-- SELECT CLAUSE

-- Selecting all columns in a table
SELECT *
FROM raw_ad_spend;

-- Selecting specific columns
SELECT channel, spend_usd, new_subscribers_attributed
FROM raw_ad_spend;

-- Assigning Alias to columns
SELECT channel as Advertisement_channel, spend_usd as ad_spend, new_subscribers_attributed AS Customers_acquired
FROM raw_ad_spend;

-- Calculated columns
SELECT
	channel,
    ROUND((spend_usd/clicks), 2) AS Cost_Per_Click, 
    ROUND((spend_usd/impressions)*1000,2) AS Cost_Per_Mille
FROM raw_ad_spend;

-- Selecting Distinct Values
SELECT DISTINCT email
FROM raw_subscribers;

SELECT DISTINCT channel
FROM raw_ad_spend;

-- Count Distinct Values
SELECT COUNT(DISTINCT email)
FROM raw_subscribers;

