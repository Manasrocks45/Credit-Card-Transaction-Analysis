
-- Credit Card Transaction Analysis
-- 01: Data Quality Checks
-- Assumed table name: dbo.transactions

-- 1. Check total number of records
SELECT COUNT(*) AS total_records
FROM dbo.transactions;

-- 2. Check missing values
SELECT
    SUM(CASE WHEN trans_num IS NULL THEN 1 ELSE 0 END) AS missing_trans_num,
    SUM(CASE WHEN amt IS NULL THEN 1 ELSE 0 END) AS missing_amount,
    SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS missing_category,
    SUM(CASE WHEN is_fraud IS NULL THEN 1 ELSE 0 END) AS missing_fraud_flag
FROM dbo.transactions;

-- 3. Check duplicate transaction IDs
SELECT trans_num, COUNT(*) AS duplicate_count
FROM dbo.transactions
GROUP BY trans_num
HAVING COUNT(*) > 1;

-- 4. Check transaction amount range
SELECT
    MIN(amt) AS minimum_amount,
    MAX(amt) AS maximum_amount,
    AVG(amt) AS average_amount
FROM dbo.transactions;

-- 5. Check fraud distribution
SELECT
    is_fraud,
    COUNT(*) AS transaction_count
FROM dbo.transactions
GROUP BY is_fraud;
