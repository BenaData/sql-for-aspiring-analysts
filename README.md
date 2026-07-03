# SQL for Data Analysts — A Practical MySQL Roadmap

A structured, hands-on path from SQL fundamentals to interview-ready proficiency — built and maintained by [Benard Musyoka Mwinzi](https://benadata.github.io) using MySQL 8.

> Every section pairs a concept with runnable `.sql` scripts against a real dataset, so you're never just reading theory — you're querying.

---

**Dataset used throughout:** a subscription/SaaS marketing analytics set — five linked tables covering the full customer lifecycle:

| Table | Key columns | What it captures |
|---|---|---|
| `subscribers` | `subscriber_id`, `signup_date`, `cohort_month`, `plan_tier`, `acquisition_channel`, `status`, `churn_date`, `monthly_price`, `country` | Who signed up, when, how, and whether they've churned |
| `orders` | `order_id`, `subscriber_id`, `order_date`, `plan_tier`, `amount`, `cogs`, `status`, `payment_method` | Billing events per subscriber |
| `refunds` | `refund_id`, `order_id`, `subscriber_id`, `refund_date`, `refund_amount`, `reason` | Refunds linked back to orders |
| `ad_spend` | `month`, `channel`, `spend_usd`, `impressions`, `clicks`, `new_subscribers_attributed`, `cpm`, `cpc`, `cac` | Monthly acquisition spend and cost-per-acquisition by channel |
| `email_events` | `event_id`, `subscriber_id`, `campaign`, `event_date`, `sent`, `opened`, `clicked`, `converted`, `variant` | Email funnel + A/B test variants |

Using one consistent, multi-table dataset across every module — instead of a new toy table each time — mirrors how real analysts actually work, and `subscriber_id` as a shared key across four of the five tables gives genuine multi-table join practice, not just single-table exercises.

---

## The Roadmap

| # | Module | What's Covered |
|---|--------|-----------------|
| 1 | **Foundations** | `SELECT`, `WHERE`, `ORDER BY`, `DISTINCT`, `LIMIT`, comparison & logical operators, **NULL handling** (`IS NULL`, `COALESCE`, three-valued logic) |
| 2 | **Aggregation** | `GROUP BY`, `HAVING` vs `WHERE`, `COUNT`, `SUM`, `AVG`, `MIN`/`MAX`, `GROUP_CONCAT` |
| 3 | **Joins** | `INNER`, `LEFT`, `RIGHT`, `FULL OUTER` (MySQL workaround via `UNION`), `SELF JOIN`, **anti-joins** (`LEFT JOIN ... WHERE NULL`) |
| 4 | **Subqueries & CTEs** | Scalar/correlated subqueries, `WITH` clauses, **recursive CTEs** (MySQL 8+), CTE vs subquery readability tradeoffs |
| 5 | **Window Functions** | `RANK`, `DENSE_RANK`, `ROW_NUMBER`, `LAG`/`LEAD`, running totals, `NTILE`, frame clauses (`ROWS BETWEEN`) |
| 6 | **Data Manipulation & Integrity** | `INSERT`, `UPDATE`, `DELETE`, `ALTER`, constraints (`PK`, `FK`, `UNIQUE`, `CHECK`), **transactions** (`COMMIT`/`ROLLBACK`) |
| 7 | **String Functions** | `CONCAT`, `SUBSTRING`, `TRIM`, `REPLACE`, `LOCATE`, `LENGTH`, **`REGEXP`** (MySQL 8 regex support) |
| 8 | **Date & Time Functions** | `DATEDIFF`, `DATE_ADD`/`DATE_SUB`, `DATE_FORMAT`, `STR_TO_DATE`, extracting fiscal periods |
| 9 | **Conditional Logic** | `CASE WHEN`, `COALESCE`, `NULLIF`, `IF()`, `IFNULL()` |
| 10 | **Analyst Patterns** | MoM subscriber/revenue growth, **cohort retention curves** (via `cohort_month`), **email funnel analysis** (sent → opened → clicked → converted), **CAC by channel** (`ad_spend`), churn rate, refund rate, deduplication |
| 11 | **Performance & Optimization** | Indexes (B-tree basics), reading `EXPLAIN` output, query rewriting, avoiding `SELECT *`, index vs full scan |
| 12 | **Capstone: Subscription Analytics Pipeline** | End-to-end: acquisition cost by channel → signup-to-conversion funnel → monthly cohort retention → churn & refund impact on revenue — joining all 5 tables via `subscriber_id`/`order_id` |
| 13 | **Interview Cheatsheet** | 30 must-know concepts, common trick questions (e.g. `WHERE` vs `HAVING`, why `COUNT(col)` ≠ `COUNT(*)` with NULLs), query-writing speed drills |

**Repo:** [github.com/BenaData/sql-for-aspiring-analysts](https://github.com/BenaData/sql-for-aspiring-analysts)
