use [bank project]
SELECT * FROM [Customer-Churn-Records]

--Data cleaning
SELECT 
SUM(CASE when RowNumber is null then 1 else 0 end) as RowNumber_missing,
SUM(CASE when Customerid is null then 1 else 0 end) as Customerid_missing,
SUM(CASE when Surname is null then 1 else 0 end) as Surname_missing,
SUM(CASE when CreditScore is null then 1 else 0 end) as CreditScore_missing,
SUM(CASE when Geography is null then 1 else 0 end) as Geography_missing,
SUM(CASE when Gender is null then 1 else 0 end) as Gender_missing,
SUM(CASE when Age is null then 1 else 0 end) as Age_missing,
SUM(CASE when Tenure is null then 1 else 0 end) as Tenure_missing,
SUM(CASE when Balance is null then 1 else 0 end) as Balance_missing,
SUM(CASE when NumOfProducts is null then 1 else 0 end) as NumOfProducts_missing,
SUM(CASE when HasCrCard is null then 1 else 0 end) as HasCrCard_missing,
SUM(CASE when IsActiveMember is null then 1 else 0 end) as IsActiveMember_missing,
SUM(CASE when EstimatedSalary is null then 1 else 0 end) as EstimatedSalary_missing,
SUM(CASE when Exited is null then 1 else 0 end) as Exited_missing,
SUM(CASE when Complain is null then 1 else 0 end) as Complain_missing,
SUM(CASE when Satisfaction_Score is null then 1 else 0 end) as Satisfaction_Score_missing,
SUM(CASE when Card_Type is null then 1 else 0 end) as Card_Type_missing,
SUM(CASE when Point_Earned is null then 1 else 0 end) as Point_Earned_missing
FROM [Customer-Churn-Records];

--Checking duplicate values
SELECT
COUNT(*) as duplicate_count
FROM [Customer-Churn-Records]
GROUP BY 
RowNumber,
CustomerId,
Surname,
CreditScore,
Geography,
Gender,
Age,
Tenure,
Balance,
NumOfProducts,
HasCrCard,
IsActiveMember,
EstimatedSalary,
Exited,
Complain,
Satisfaction_Score,
Card_Type,
Point_Earned
HAVING COUNT(*) > 1;

UPDATE [Customer-Churn-Records] set Surname =TRIM(Surname);
UPDATE [Customer-Churn-Records] set Geography =LTRIM(Geography);
UPDATE [Customer-Churn-Records] set Gender =RTRIM(Gender);
UPDATE [Customer-Churn-Records] set Card_Type =TRIM(Card_Type);

--Aggregate function(SUM,AVG,MAX,MIN,COUNT)
SELECT
SUM(Balance) as total_balance,
MAX(Balance) as max_balance,
MIN(Balance) as min_balance,
AVG(Balance) as avg_balance,
COUNT(*) as total_count
FROM [Customer-Churn-Records];

--Total Point by card type
SELECT Card_Type,
SUM(Point_Earned) as total_expense_point
FROM [Customer-Churn-Records]
GROUP BY Card_Type
ORDER BY total_expense_point desc;

--OPERATORS(OR,IN,BETWEEN,LIKE,COMPARISON)
SELECT * FROM [Customer-Churn-Records] WHERE Geography IN ('Spain','Germany') AND
CreditScore BETWEEN 600 AND 700;

--Customers whose Surname starts with 'S'.
SELECT top 10 * FROM [Customer-Churn-Records] WHERE Surname LIKE '%Hao%' AND NOT Geography= 'France';

--Female customers who Exited.
SELECT * FROM [Customer-Churn-Records] WHERE Gender ='Female' AND Exited = 1;
SELECT * FROM [Customer-Churn-Records] WHERE Surname ='Onio' AND Balance > 2000;

--AGGREAGTE FUNCTION + CLAUSE
--Find Geography Total churned customers, sorted by churn count
SELECT Geography, 
COUNT(*) as total_churned_customer FROM [Customer-Churn-Records]
WHERE Exited = 1
GROUP BY Geography
ORDER BY total_churned_customer desc;

-- Find Gender,Geography having sum CreditScore > 200.
SELECT Gender, Geography,
SUM(CreditScore) as avg_score FROM [Customer-Churn-Records]
GROUP BY Gender, Geography
HAVING SUM(CreditScore) > 200
ORDER BY avg_score desc;

--Find Card Type where average Balance > 50000, sorted by avg balance DESC.
SELECT Card_Type,
AVG(Balance) as avg_balance FROM [Customer-Churn-Records]
GROUP BY Card_Type
HAVING AVG(Balance) > 50000
ORDER BY avg_balance desc;

--Top 3 Card Types with highest average EstimatedSalary (having avg > 100000).
SELECT Top 3 Card_Type,
AVG(EstimatedSalary) as avg_EstimatedSalary FROM [Customer-Churn-Records]
GROUP BY Card_Type
HAVING AVG(EstimatedSalary) > 100000
ORDER BY avg_EstimatedSalary desc;

SELECT DISTINCT Surname,Age,Tenure FROM [Customer-Churn-Records]
GROUP BY Surname,Age,Tenure;

--FUNCTION(STRING,NUMERIC,DATE AND TIME,CONVERSION,NULL HANDLING)
--STRING FUNCTION(always works in text format)
--upper(),lower(),length(),trim(),Substring(),concat()
SELECT UPPER(Surname) AS upper_surname, 
LEN(Surname) AS surname_Length,
CONCAT('MR. ',TRIM(Surname)) AS name_with_title
FROM [Customer-Churn-Records];

--substring(find the particular character of text)
SELECT SUBSTRING(Surname,1,4) as Short_surname
FROM [Customer-Churn-Records];

--FUNCTION(ROUND,CEIL)
--Nearest decimal value of round
--always integer value in top of ceiling
SELECT EstimatedSalary,
ROUND(EstimatedSalary,2) AS round_estimatedsalary,
CEILING(EstimatedSalary) AS high_estimatedsalary
FROM [Customer-Churn-Records];

--CONDITION FUNCTION(CASE,IF,COALESCE,ISNULL)
--Create Age Groups: Young, Middle-Aged, Senior
SELECT Age,
CASE WHEN Age < 30 THEN 'Young'
WHEN Age BETWEEN 30 AND 50 THEN 'Middle-Age'
ELSE 'Senior'
END AS Age_Group
FROM [Customer-Churn-Records];

--Create Balance Categories: No Balance, Low, High
SELECT Balance,
CASE WHEN Balance = 0 THEN 'NO BALANCE'
WHEN Balance <= 10000 THEN 'LOW BALANCE'
WHEN Balance >= 10000 THEN 'HIGH BALANCE'
END AS BALANCE_STATUS
FROM [Customer-Churn-Records];

--IF
--HasCrCard
SELECT IIF(HasCrCard = 1,'Hascard','No Card') as card_status
FROM [Customer-Churn-Records];

--NULL TO 0
SELECT COALESCE(Satisfaction_Score,0) AS score
FROM [Customer-Churn-Records];

--SUBQUERY
--Find customers whose Balance is greater than average Balance.
SELECT CustomerID,
Balance FROM [Customer-Churn-Records]
WHERE Balance > (SELECT AVG(Balance) as avg_balance FROM [Customer-Churn-Records]);

--Find customers with the maximum CreditScore.
SELECT top 10 * FROM [Customer-Churn-Records]
WHERE CreditScore = (SELECT MAX(CreditScore) FROM [Customer-Churn-Records]);

--Find customers from Geography where average Balance is highest.
SELECT Surname,
Geography,
Balance FROM [Customer-Churn-Records]
WHERE Geography = (SELECT top 1 Geography
FROM [Customer-Churn-Records]
GROUP BY Geography
ORDER BY AVG(CAST(Balance as float)) desc);

--WINDOW FUNCTION
-- Find running total of Point Earned ordered by Age.
SELECT Age,Point_Earned,
SUM(Point_Earned) OVER(ORDER BY Age) as running_total
FROM [Customer-Churn-Records];

--PARTITION BY(its like a group by )
--SUM,AVG,COUNT,MAX,MIN
SELECT top 10 Gender,Balance,
SUM(Balance) OVER(PARTITION BY Gender) as Total_balance,
AVG(Balance) OVER(PARTITION BY Gender) as avg_balance,
MAX(Balance) OVER(PARTITION BY Gender) as Highest_balance,
MIN(Balance) OVER(PARTITION BY Gender) as Lowest_balance,
COUNT(*) OVER(PARTITION BY Gender) as Total_Count
FROM [Customer-Churn-Records]
ORDER BY Balance desc;

--Row Number()
SELECT CustomerId,Surname,Geography,Balance, ROW_NUMBER() 
OVER(ORDER BY Balance desc) as row_num
FROM [Customer-Churn-Records];

--RANK()
--if the values are same it skips the next value and assigns the same rank to the value 
SELECT CustomerId,Surname,Geography,Balance, RANK() 
OVER(ORDER BY Balance desc) as rank_balance
FROM [Customer-Churn-Records];

--Find previous customer's Balance in same Geography using LAG.
SELECT CustomerId,Geography,Balance,
LAG(Balance) OVER(Partition by Geography ORDER BY CustomerID)
AS previous_customer_balance
FROM [Customer-Churn-Records];

--dense_rank()
SELECT Surname,EstimatedSalary,dense_rank() OVER(ORDER BY EstimatedSalary desc) AS dense_rank_numb
FROM [Customer-Churn-Records];

--Using CTE,AVG Balance of Geography
WITH Avg_balance_geo AS(
SELECT Geography,AVG(Balance) as avg_balance
FROM [Customer-Churn-Records]
GROUP BY Geography)
SELECT * FROM Avg_balance_geo
Where avg_balance > 10000;

WITH HighcustomerGeo as(
SELECT  top 10 Geography,AVG(Balance) as avg_balace
FROM [Customer-Churn-Records]
GROUP BY Geography
ORDER BY AVG(Balance) desc)
SELECT * FROM [Customer-Churn-Records]
Where Geography IN(SELECT Geography FROM HighcustomerGeo);

--VIEW , INDEXING,CAST
--VIEW(TO SAVE THE DATA)
--Active_Customers view banao
CREATE VIEW Active_Customer AS
SELECT CustomerId,Geography,Balance FROM [Customer-Churn-Records]
WHERE IsActiveMember = 1;
SELECT * FROM Active_Customer;

-- Create view table Churned_Germany 
CREATE VIEW Churned_Germany as
SELECT * FROM [Customer-Churn-Records]
WHERE Geography = 'Germany' AND Exited = 1;
SELECT * FROM Churned_Germany;

--Index 
CREATE INDEX idx_geog ON [Customer-Churn-Records](Geography);

CREATE INDEX idx_geo_gender ON [Customer-Churn-Records](Geography,Gender);

--CAST
SELECT SUM(CAST(Balance as bigint)) AS total_balance 
FROM [Customer-Churn-Records];

SELECT AVG(CAST(CreditScore as decimal(10,2))) as avg_score
FROM [Customer-Churn-Records];









