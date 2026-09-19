# SQL-project ## Dataset Description

The Finance & Accounting dataset contains 500 financial transaction records designed for analyzing accounting activities, transaction patterns, payment methods, vendors, expenses, and potential fraudulent transactions.

Each record represents an individual financial transaction and includes information about the transaction date, account type, vendor, transaction category, amount, currency, payment method, transaction description, and fraud status.

### Dataset Features

| Column           | Description                                                                                                               |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `transaction_id` | Unique identifier assigned to each transaction                                                                            |
| `date`           | Date on which the transaction occurred                                                                                    |
| `account`        | Account classification associated with the transaction, such as Assets, Expense, or Liability                             |
| `vendor`         | Vendor or business associated with the transaction                                                                        |
| `category`       | Financial category of the transaction, such as Logistics, Utilities, or Office Supplies                                   |
| `amount`         | Monetary value of the transaction                                                                                         |
| `currency`       | Currency used for the transaction                                                                                         |
| `payment_method` | Method used to complete the payment, such as Cash, Bank Transfer, or Online Payment                                       |
| `description`    | Textual description of the transaction                                                                                    |
| `is_fraud`       | Fraud indicator where `0` represents a non-fraudulent transaction and `1` represents a potentially fraudulent transaction |

### Dataset Size

* Number of records: 500
* Number of columns: 10
* Primary identifier: `transaction_id`
* Financial measure: `amount`
* Fraud classification: `is_fraud`

### Purpose of the Dataset

This dataset can be used to perform financial and accounting analysis, including:

* Transaction and revenue analysis
* Expense analysis
* Vendor performance analysis
* Category-wise financial analysis
* Payment method analysis
* Account-level transaction analysis
* Fraud transaction identification
* Transaction trend analysis over time
* SQL-based financial reporting and aggregation

The dataset is particularly suitable for SQL projects involving `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`, aggregate functions such as `SUM`, `AVG`, `COUNT`, and `MAX/MIN`, as well as financial analysis and fraud detection queries.

### Data Type Overview

The dataset contains:

* Categorical data: account, vendor, category, currency, payment method
* Numerical data: amount, is_fraud
* Date data: date
* Text data: description
* Identifier data: transaction_id

Overall, the dataset provides a structured foundation for demonstrating SQL skills and performing practical Finance & Accounting data analysis.
The data analysis was done by the SQL Query and it can be file uploaded 
