
/* Credit Card Transaction Analysis
   Create the cleaned transaction table */

CREATE TABLE dbo.transactions
(
    trans_num       VARCHAR(100),
    trans_date_trans_time DATETIME2,
    txn_date        DATE,
    txn_hour        INT,
    card_id         VARCHAR(50),
    merchant_clean  VARCHAR(255),
    category        VARCHAR(100),
    amt             DECIMAL(12,2),
    amount_band     VARCHAR(50),
    gender          VARCHAR(20),
    customer_age    INT,
    state           VARCHAR(50),
    distance_km     DECIMAL(12,2),
    is_fraud        INT,
    fraud_label     VARCHAR(30)
);
