# SQL for Data Analysts — A Practical MySQL Roadmap

A structured, hands-on path from SQL fundamentals to interview-ready proficiency — built and maintained by [Benard Musyoka Mwinzi](https://benadata.github.io) using MySQL 8.

> Every section pairs a concept with runnable `.sql` scripts against a real dataset, so you're never just reading theory — you're querying.

---

## How this repo is organized

Each module lives in its own numbered folder (`01_foundations`, `02_aggregation`, etc.) containing:
- `queries.sql` — commented, runnable examples
- `exercises.sql` — practice problems (answers in `solutions.sql`)
- `README.md` — a short explainer with the "why," not just the "how"

**Dataset used throughout:** a subscription/SaaS marketing analytics set — five linked tables covering the full customer lifecycle:

| Table | Key columns | What it captures |
|---|---|---|
| `subscribers` | `subscriber_id`, `signup_date`, `cohort_month`, `plan_tier`, `acquisition_channel`, `status`, `churn_date`, `monthly_price`, `country` | Who signed up, when, how, and whether they've churned |
| `orders` | `order_id`, `subscriber_id`, `order_date`, `plan_tier`, `amount`, `cogs`, `status`, `payment_method` | Billing events per subscriber |
| `refunds` | `refund_id`, `order_id`, `subscriber_id`, `refund_date`, `refund_amount`, `reason` | Refunds linked back to orders |
| `ad_spend` | `month`, `channel`, `spend_usd`, `impressions`, `clicks`, `new_subscribers_attributed`, `cpm`, `cpc`, `cac` | Monthly acquisition spend and cost-per-acquisition by channel |
| `email_events` | `event_id`, `subscriber_id`, `campaign`, `event_date`, `sent`, `opened`, `clicked`, `converted`, `variant` | Email funnel + A/B test variants |

Using one consistent, multi-table dataset across all 14 modules (instead of a new toy table each time) is a meaningful improvement — it mirrors how real analysts actually work, and `subscriber_id` as a shared key across four of the five tables gives you genuine multi-table join practice, not just single-table exercises.

---

## The Roadmap

| # | Module | What's Covered | Why It Matters |
|---|--------|-----------------|-----------------|
| 0 | **Environment & Dataset Setup** | Installing MySQL, importing the dataset, ER diagram, `SHOW`/`DESCRIBE` basics | Recruiters skim READMEs — a clean setup section signals professionalism before they even see a query |
| 1 | **Foundations** | `SELECT`, `WHERE`, `ORDER BY`, `DISTINCT`, `LIMIT`, comparison & logical operators, **NULL handling** (`IS NULL`, `COALESCE`, three-valued logic) | NULL handling is where most beginners silently write wrong queries — worth its own emphasis, not a footnote |
| 2 | **Aggregation** | `GROUP BY`, `HAVING` vs `WHERE`, `COUNT`, `SUM`, `AVG`, `MIN`/`MAX`, `GROUP_CONCAT` | Add `GROUP_CONCAT` — it's MySQL-specific and shows up constantly in real analyst work |
| 3 | **Joins** | `INNER`, `LEFT`, `RIGHT`, `FULL OUTER` (MySQL workaround via `UNION`), `SELF JOIN`, **anti-joins** (`LEFT JOIN ... WHERE NULL`) | MySQL has no native `FULL OUTER JOIN` — showing you know the workaround is a strong signal of real MySQL fluency, not textbook SQL |
| 4 | **Subqueries & CTEs** | Scalar/correlated subqueries, `WITH` clauses, **recursive CTEs** (MySQL 8+), CTE vs subquery readability tradeoffs | Recursive CTEs (org charts, date sequences) are a common interview differentiator and missing from the original list |
| 5 | **Window Functions** | `RANK`, `DENSE_RANK`, `ROW_NUMBER`, `LAG`/`LEAD`, running totals, `NTILE`, frame clauses (`ROWS BETWEEN`) | Add `NTILE` for percentile/quartile bucketing — directly useful for RFM-style scoring |
| 6 | **Data Manipulation & Integrity** | `INSERT`, `UPDATE`, `DELETE`, `ALTER`, constraints (`PK`, `FK`, `UNIQUE`, `CHECK`), **transactions** (`COMMIT`/`ROLLBACK`) | Transactions are a notable gap — even analysts should understand atomicity when writing UPDATE/DELETE against production-like data |
| 7 | **String Functions** | `CONCAT`, `SUBSTRING`, `TRIM`, `REPLACE`, `LOCATE`, `LENGTH`, **`REGEXP`** (MySQL 8 regex support) | Regex matching is increasingly expected for data cleaning tasks |
| 8 | **Date & Time Functions** | `DATEDIFF`, `DATE_ADD`/`DATE_SUB`, `DATE_FORMAT`, `STR_TO_DATE`, extracting fiscal periods | Keep as-is — solid as originally listed |
| 9 | **Conditional Logic** | `CASE WHEN`, `COALESCE`, `NULLIF`, `IF()`, `IFNULL()` | Add MySQL's own `IF()`/`IFNULL()` alongside standard SQL — shows dialect awareness |
| 10 | **Analyst Patterns** | MoM subscriber/revenue growth, **cohort retention curves** (via `cohort_month`), **email funnel analysis** (sent → opened → clicked → converted), **CAC by channel** (`ad_spend`), churn rate, refund rate, deduplication | Cohort retention and funnel analysis map directly onto this dataset's actual columns — a much stronger "applied" signal than generic examples, since a recruiter can see you reasoning about real subscription-business metrics |
| 11 | **Performance & Optimization** | Indexes (B-tree basics), reading `EXPLAIN` output, query rewriting, avoiding `SELECT *`, index vs full scan | Add "reading EXPLAIN output" explicitly — this is the single most-asked practical skill in SQL interviews and was implicit but not named before |
| 12 | **Capstone: Subscription Analytics Pipeline** | End-to-end: acquisition cost by channel → signup-to-conversion funnel → monthly cohort retention → churn & refund impact on revenue — joining all 5 tables via `subscriber_id`/`order_id`, numbered scripts, business question → query → insight | This is what turns "tutorial repo" into "portfolio piece." A CAC-to-churn pipeline across 5 joined tables is a much stronger recruiter signal than a single-table exercise |
| 13 | **Interview Cheatsheet** | 30 must-know concepts, common trick questions (e.g. `WHERE` vs `HAVING`, why `COUNT(col)` ≠ `COUNT(*)` with NULLs), query-writing speed drills | Keep as the closing module — strong as originally conceived |

---

## What changed from your original list, and why

1. **Added Module 0 (setup)** — first impressions matter when recruiters click through; a clean setup section signals rigor.
2. **Split "Data Manipulation" to include transactions** — commonly overlooked but relevant for analysts doing data cleaning/ETL work.
3. **Named specific MySQL dialect quirks** (no native `FULL OUTER JOIN`, `REGEXP`, `IF()`/`IFNULL()`, recursive CTEs) — generic SQL roadmaps don't do this, and calling it out shows you know MySQL specifically, not "SQL in general."
4. **Added a Capstone module before the cheatsheet** — a CAC → funnel → cohort retention → churn/refund pipeline across all 5 tables turns the repo from "I can follow a tutorial" into "I can build a pipeline," which is the actual signal recruiters are scanning for.
5. **Reordered slightly** — Conditional Logic naturally follows String/Date functions since `CASE WHEN` often wraps them.

---

## Posting Strategy (X / LinkedIn)

A few suggestions for how to roll this out rather than dropping the whole repo at once:

- **Thread per module**: Post one module at a time (e.g., "Module 5: Window Functions — the one SQL topic that separates junior from mid-level analysts 🧵"). This gives you 13+ pieces of content from one repo instead of one.
- **Screenshot the query + result**, not just code blocks — visual proof of output performs better on both platforms.
- **Pin the capstone module** as a standalone post — "I built a full CAC-to-churn analytics pipeline in MySQL" performs well because it names a business outcome, not just a SQL topic. This is your strongest recruiter-facing asset. Link to [github.com/BenaData/sql-for-aspiring-analysts](https://github.com/BenaData/sql-for-aspiring-analysts).
- **Use consistent hashtags/framing**: `#SQL #MySQL #DataAnalytics` plus a line like "Part of my open SQL curriculum for aspiring analysts" — this signals you're building in public, which reads well to recruiters browsing profiles.

---

## Suggested repo file structure

```
sql-for-analysts/
├── README.md                  (this roadmap, as the repo's front page)
├── 00_setup/
├── 01_foundations/
├── 02_aggregation/
├── 03_joins/
├── 04_subqueries_ctes/
├── 05_window_functions/
├── 06_data_manipulation/
├── 07_string_functions/
├── 08_date_functions/
├── 09_conditional_logic/
├── 10_analyst_patterns/
├── 11_performance/
├── 12_capstone_project/
└── 13_interview_cheatsheet/
```
