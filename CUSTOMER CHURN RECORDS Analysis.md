# Bank Customer Churn Dataset

## Dataset Overview

The Bank Customer Churn dataset contains information about 10,000 bank customers and is designed to analyze customer behavior and identify factors associated with customer churn.

The dataset includes demographic, financial, banking activity, customer satisfaction, and card-related information. The main target variable is `Exited`, which indicates whether a customer has left the bank.

This dataset can be used for SQL analysis, exploratory data analysis, customer segmentation, churn analysis, and machine learning projects.

## Dataset Size

* Number of records: 10,000
* Number of columns: 18
* Missing values: None
* Duplicate records: None
* Geographic regions: France, Spain, Germany
* Card types: DIAMOND, GOLD, SILVER, PLATINUM

## Column Description

| Column             | Description                                                             |
| ------------------ | ----------------------------------------------------------------------- |
| RowNumber          | Unique row number assigned to each customer record                      |
| CustomerId         | Unique identification number of the customer                            |
| Surname            | Customer's surname                                                      |
| CreditScore        | Credit score of the customer                                            |
| Geography          | Country where the customer is located                                   |
| Gender             | Gender of the customer                                                  |
| Age                | Age of the customer                                                     |
| Tenure             | Number of years the customer has been with the bank                     |
| Balance            | Customer's bank account balance                                         |
| NumOfProducts      | Number of banking products used by the customer                         |
| HasCrCard          | Indicates whether the customer has a credit card                        |
| IsActiveMember     | Indicates whether the customer is an active member of the bank          |
| EstimatedSalary    | Estimated annual salary of the customer                                 |
| Exited             | Indicates whether the customer left the bank; 1 = Churned, 0 = Retained |
| Complain           | Indicates whether the customer made a complaint                         |
| Satisfaction Score | Customer satisfaction rating                                            |
| Card Type          | Type of bank card held by the customer                                  |
| Point Earned       | Reward or loyalty points earned by the customer                         |

## Key Dataset Information

The `Exited` column is the primary churn indicator in this dataset. There are 2,038 customers who have exited the bank, representing approximately 20.38% of the total customers.

The dataset contains customers from three countries: France, Spain, and Germany. It also includes both male and female customers and four different card types.

Some important numerical characteristics of the dataset include:

* Average Credit Score: approximately 650.53
* Average Age: approximately 38.92 years
* Average Account Balance: approximately 76,485.89
* Average Estimated Salary: approximately 100,090.24

## Potential Analysis

This dataset can be analyzed to understand the factors associated with customer churn. Some useful questions for analysis include:

1. Which country has the highest customer churn rate?
2. What is the average balance of customers who churned compared with those who stayed?
3. Does credit score have a relationship with customer churn?
4. How does customer age affect churn?
5. Does having a credit card influence customer retention?
6. Are active members less likely to leave the bank?
7. Which card type has the highest number of churned customers?
8. How does customer satisfaction relate to churn?
9. Does the number of banking products affect customer churn?
10. Which geographical region has the highest average customer balance?

## Project Objective

The objective of this project is to analyze bank customer data and identify patterns and factors associated with customer churn. The analysis can help understand customer behavior, compare different customer segments, and identify areas that may require further investigation for customer retention.

## Tools and Technologies

This dataset can be used with:

* SQL
* Python
* Pandas
* Matplotlib
* Seaborn
* Excel
* Power BI
* Tableau

## File

`Customer-Churn-Records.csv`

This dataset is suitable for practicing data cleaning, SQL queries, exploratory data analysis, data visualization, and customer churn analysis.
The data analysis was done by the sql query, it can be find in uploaded 
