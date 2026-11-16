Credit Card Transaction Analysis

An end-to-end data analytics project exploring transaction behaviour, spending patterns, and fraud-labelled transactions using Python, SQL, and DuckDB.

Project Overview

This project analyses a simulated credit card transaction dataset containing 1,296,675 transactions from January 2019 to June 2020.

The objective is to identify transaction trends, understand spending behaviour, and explore patterns associated with fraudulent transactions.

Business Questions

- What is the overall transaction volume and value?
- Which categories and merchants account for the highest spending?
- How do fraud rates vary across transaction categories?
- Are fraud-labelled transactions more common during particular hours?
- How do transaction amounts relate to fraud rates?
- What patterns appear across states and customer age groups?
- Does transaction distance differ between legitimate and fraud-labelled transactions?

Tools & Technologies

- Python: Data cleaning and exploratory data analysis
- Pandas & NumPy: Data manipulation
- Matplotlib & Seaborn: Data visualisation
- SQL: Analytical queries
- DuckDB: SQL execution
- Google Colab: Notebook environment
- GitHub: Project documentation and version control
- Power BI: Planned interactive dashboard

Repository Structure

Credit-Card-Transaction-Analysis/
│
├── Python/
│   ├── credit_card_analysis.ipynb
│   └── README.md
│
├── SQL/
│   ├── 00_create_table.sql
│   ├── 01_data_quality_checks.sql
│   ├── 02_transaction_analysis.sql
│   └── README.md
│
├── PROJECT_FINDINGS.md
└── README.md

Key Findings

Metric| Result
Total Transactions| 1,296,675
Unique Cards| 983
Total Transaction Value| $91.22 Million
Average Transaction Amount| $70.35
Fraud-Labelled Transactions| 7,506
Overall Fraud Rate| 0.58%
Fraud Value Share| 4.37%

Highlights

- Grocery POS accounted for approximately 15.9% of total transaction value.
- Shopping Net recorded the highest category-level fraud rate at approximately 1.76%.
- Transactions above $1,000 had a fraud rate of approximately 24.13%.
- The highest hourly fraud rate was observed at 10 PM, approximately 2.88%.
- December 2019 recorded the highest monthly transaction volume.

See "PROJECT_FINDINGS.md" (PROJECT_FINDINGS.md) for detailed findings.

Data Quality

The project includes checks for:

- Missing values
- Duplicate transaction IDs
- Invalid transaction amounts
- Fraud flag distribution
- Date and coordinate consistency

Important Limitations

- The dataset contains simulated transactions, not real bank customer data.
- Fraud labels are provided by the dataset and are used for descriptive analysis.
- The project does not currently implement a predictive fraud-detection model.
- Observed associations do not establish causation.
- June 2020 contains partial-month data.

Project Status

- [x] Data cleaning and preparation
- [x] Exploratory data analysis
- [x] Python visualisations
- [x] SQL analysis and data quality scripts
- [x] Project findings documentation
- [ ] Power BI dashboard

Author

Manas

This project is part of my data analytics portfolio, demonstrating practical skills in Python, SQL, data analysis, and business insights.
