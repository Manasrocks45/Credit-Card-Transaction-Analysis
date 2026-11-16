
/* Credit Card Transaction Analysis
   Create the transactions table
   Database: DuckDB */

CREATE TABLE IF NOT EXISTS transactions
(
    trans_num               VARCHAR,
    trans_date_trans_time   TIMESTAMP,
    txn_date                DATE,
    txn_hour                BIGINT,
    card_id                 VARCHAR,
    merchant                VARCHAR,
    category                VARCHAR,
    amt                     DOUBLE,
    amount_band             VARCHAR,
    gender                  VARCHAR,
    customer_age            BIGINT,
    state                   VARCHAR,
    distance_km             DOUBLE,
    is_fraud                BIGINT,
    fraud_label             VARCHAR
);
