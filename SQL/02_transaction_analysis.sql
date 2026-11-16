
/* =====================================================
   PROJECT: CREDIT CARD TRANSACTION ANALYSIS
   FILE: 02_transaction_analysis.sql
   PURPOSE: Business analysis using SQL Server
   ===================================================== */

-- NOTE:
-- Replace dbo.transactions with your actual SQL table name
-- if it is different.


/* 1. Total number of transactions */

SELECT
    COUNT(*) AS total_transactions
FROM dbo.transactions;


/* 2. Total transaction amount */

SELECT
    SUM(amt) AS total_transaction_amount
FROM dbo.transactions;


/* 3. Average transaction amount */

SELECT
    AVG(amt) AS average_transaction_amount
FROM dbo.transactions;


/* 4. Fraud vs legitimate transactions */

SELECT
    fraud_label,
    COUNT(*) AS transaction_count,
    SUM(amt) AS total_amount
FROM dbo.transactions
GROUP BY fraud_label;


/* 5. Transaction count by category */

SELECT
    category,
    COUNT(*) AS transaction_count,
    SUM(amt) AS total_amount
FROM dbo.transactions
GROUP BY category
ORDER BY total_amount DESC;


/* 6. Top 10 merchants by transaction amount */

SELECT TOP 10
    merchant_clean,
    COUNT(*) AS transaction_count,
    SUM(amt) AS total_amount
FROM dbo.transactions
GROUP BY merchant_clean
ORDER BY total_amount DESC;


/* 7. Transaction amount by state */

SELECT
    state,
    COUNT(*) AS transaction_count,
    SUM(amt) AS total_amount
FROM dbo.transactions
GROUP BY state
ORDER BY total_amount DESC;


/* 8. Fraud rate by category */

SELECT
    category,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END)
        AS fraud_transactions,
    CAST(
        100.0 * SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0)
        AS DECIMAL(10,2)
    ) AS fraud_rate_pct
FROM dbo.transactions
GROUP BY category
ORDER BY fraud_rate_pct DESC;


/* 9. Fraud rate by transaction hour */

SELECT
    txn_hour,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END)
        AS fraud_transactions
FROM dbo.transactions
GROUP BY txn_hour
ORDER BY txn_hour;


/* 10. High-value transactions */

SELECT
    trans_num,
    txn_date,
    merchant_clean,
    category,
    amt,
    state,
    fraud_label
FROM dbo.transactions
WHERE amt > 500
ORDER BY amt DESC;


/* 11. Customer age group analysis */

SELECT
    CASE
        WHEN customer_age < 25 THEN 'Under 25'
        WHEN customer_age BETWEEN 25 AND 40 THEN '25-40'
        WHEN customer_age BETWEEN 41 AND 60 THEN '41-60'
        ELSE 'Above 60'
    END AS age_group,
    COUNT(*) AS transaction_count,
    AVG(amt) AS average_amount
FROM dbo.transactions
GROUP BY
    CASE
        WHEN customer_age < 25 THEN 'Under 25'
        WHEN customer_age BETWEEN 25 AND 40 THEN '25-40'
        WHEN customer_age BETWEEN 41 AND 60 THEN '41-60'
        ELSE 'Above 60'
    END
ORDER BY transaction_count DESC;


/* 12. Transaction distance analysis */

SELECT
    AVG(distance_km) AS average_distance_km,
    MAX(distance_km) AS maximum_distance_km,
    MIN(distance_km) AS minimum_distance_km
FROM dbo.transactions;


/* 13. Daily transaction trends */

SELECT
    txn_date,
    COUNT(*) AS transaction_count,
    SUM(amt) AS daily_transaction_amount
FROM dbo.transactions
GROUP BY txn_date
ORDER BY txn_date;


/* 14. Fraud transactions by state */

SELECT
    state,
    COUNT(*) AS fraud_count
FROM dbo.transactions
WHERE is_fraud = 1
GROUP BY state
ORDER BY fraud_count DESC;


/* 15. Overall fraud percentage */

SELECT
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END)
        AS total_fraud_transactions,
    CAST(
        100.0 * SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0)
        AS DECIMAL(10,2)
    ) AS overall_fraud_rate_pct
FROM dbo.transactions;
