
-- =====================================================
-- PROJECT: CREDIT CARD TRANSACTION ANALYSIS
-- FILE: 02_transaction_analysis.sql
-- DATABASE: DuckDB
-- TABLE: transactions
-- =====================================================

-- 1. Overall transaction KPIs
SELECT
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT card_id) AS total_cards,
    ROUND(SUM(amt), 2) AS total_transaction_amount,
    ROUND(AVG(amt), 2) AS average_transaction_amount,
    SUM(is_fraud) AS total_fraud_transactions,
    ROUND(100.0 * SUM(is_fraud) / COUNT(*), 2)
        AS overall_fraud_rate_pct
FROM transactions;


-- 2. Fraud vs legitimate transactions
SELECT
    fraud_label,
    COUNT(*) AS transaction_count,
    ROUND(SUM(amt), 2) AS total_amount
FROM transactions
GROUP BY fraud_label;


-- 3. Transaction count by category
SELECT
    category,
    COUNT(*) AS transaction_count,
    ROUND(SUM(amt), 2) AS total_amount
FROM transactions
GROUP BY category
ORDER BY total_amount DESC;


-- 4. Top 10 merchants by transaction amount
SELECT
    merchant,
    COUNT(*) AS transaction_count,
    ROUND(SUM(amt), 2) AS total_amount
FROM transactions
GROUP BY merchant
ORDER BY total_amount DESC
LIMIT 10;


-- 5. Transaction amount by state
SELECT
    state,
    COUNT(*) AS transaction_count,
    ROUND(SUM(amt), 2) AS total_amount
FROM transactions
GROUP BY state
ORDER BY total_amount DESC;


-- 6. Fraud rate by category
SELECT
    category,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(100.0 * SUM(is_fraud) / COUNT(*), 2)
        AS fraud_rate_pct
FROM transactions
GROUP BY category
ORDER BY fraud_rate_pct DESC;


-- 7. Fraud rate by transaction hour
SELECT
    txn_hour,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(100.0 * SUM(is_fraud) / COUNT(*), 2)
        AS fraud_rate_pct
FROM transactions
GROUP BY txn_hour
ORDER BY txn_hour;


-- 8. High-value transactions
SELECT
    trans_num,
    txn_date,
    merchant,
    category,
    amt,
    state,
    fraud_label
FROM transactions
WHERE amt > 500
ORDER BY amt DESC;


-- 9. Customer age and gender analysis
SELECT
    gender,
    CASE
        WHEN customer_age < 25 THEN 'Under 25'
        WHEN customer_age BETWEEN 25 AND 39 THEN '25-39'
        WHEN customer_age BETWEEN 40 AND 54 THEN '40-54'
        WHEN customer_age BETWEEN 55 AND 69 THEN '55-69'
        ELSE '70+'
    END AS age_group,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(100.0 * SUM(is_fraud) / COUNT(*), 2)
        AS fraud_rate_pct,
    ROUND(AVG(amt), 2) AS average_amount
FROM transactions
GROUP BY gender, age_group
ORDER BY gender, age_group;


-- 10. Transaction distance by fraud label
SELECT
    fraud_label,
    COUNT(*) AS total_transactions,
    ROUND(AVG(distance_km), 2) AS average_distance_km,
    ROUND(MEDIAN(distance_km), 2) AS median_distance_km,
    ROUND(MAX(distance_km), 2) AS maximum_distance_km
FROM transactions
GROUP BY fraud_label;


-- 11. Daily transaction trends
SELECT
    txn_date,
    COUNT(*) AS transaction_count,
    ROUND(SUM(amt), 2) AS daily_transaction_amount
FROM transactions
GROUP BY txn_date
ORDER BY txn_date;


-- 12. Fraud rate by state
SELECT
    state,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(100.0 * SUM(is_fraud) / COUNT(*), 2)
        AS fraud_rate_pct
FROM transactions
GROUP BY state
HAVING COUNT(*) >= 10000
ORDER BY fraud_rate_pct DESC;


-- 13. Fraud analysis by transaction amount band
SELECT
    amount_band,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(100.0 * SUM(is_fraud) / COUNT(*), 2)
        AS fraud_rate_pct,
    ROUND(AVG(amt), 2) AS average_amount
FROM transactions
GROUP BY amount_band
ORDER BY fraud_rate_pct DESC;


-- 14. Monthly transaction trends
SELECT
    DATE_TRUNC('month', txn_date) AS transaction_month,
    COUNT(*) AS total_transactions,
    ROUND(SUM(amt), 2) AS total_amount,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(100.0 * SUM(is_fraud) / COUNT(*), 2)
        AS fraud_rate_pct
FROM transactions
GROUP BY transaction_month
ORDER BY transaction_month;
