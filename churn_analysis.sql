select top 10 * from Customers;

select count(*) as toatl_customers from Customers;

select count(*) - count(distinct CustomerId) as duplicates from Customers

SELECT COUNT(*) AS missing_values
FROM Customers
WHERE CreditScore IS NULL OR Geography IS NULL OR Age IS NULL OR Balance IS NULL;

SELECT COUNT(*) AS total,
       SUM(cast(Exited as int)) AS left_bank,
       ROUND(100.0 * SUM(cast(Exited as int)) / COUNT(*), 1) AS churn_percent
FROM Customers;

SELECT Geography,
       COUNT(*) AS customers,
       cast(100.0 * SUM(CAST(Exited AS INT)) / COUNT(*) as decimal(5,1)) AS churn_percent
FROM Customers
GROUP BY Geography
ORDER BY churn_percent DESC;

SELECT CASE WHEN Age < 30 THEN 'Under 30'
            WHEN Age BETWEEN 30 AND 39 THEN '30-39'
            WHEN Age BETWEEN 40 AND 49 THEN '40-49'
            WHEN Age BETWEEN 50 AND 59 THEN '50-59'
            ELSE '60+' END AS age_group,
       COUNT(*) AS customers,
       CAST(100.0 * SUM(CAST(Exited AS INT)) / COUNT(*) AS DECIMAL(5,1)) AS churn_percent
FROM Customers
GROUP BY CASE WHEN Age < 30 THEN 'Under 30'
              WHEN Age BETWEEN 30 AND 39 THEN '30-39'
              WHEN Age BETWEEN 40 AND 49 THEN '40-49'
              WHEN Age BETWEEN 50 AND 59 THEN '50-59'
              ELSE '60+' END
ORDER BY churn_percent DESC;

SELECT NumOfProducts,
       COUNT(*) AS customers,
       CAST(100.0 * SUM(CAST(Exited AS INT)) / COUNT(*) AS DECIMAL(5,1)) AS churn_percent
FROM Customers
GROUP BY NumOfProducts
ORDER BY NumOfProducts;

SELECT Complain,
       COUNT(*) AS customers,
       CAST(100.0 * SUM(CAST(Exited AS INT)) / COUNT(*) AS DECIMAL(5,1)) AS churn_percent
FROM Customers
GROUP BY Complain
ORDER BY Complain;

SELECT Geography,
       CASE WHEN Age >= 40 THEN '40+' ELSE 'Under 40' END AS age_band,
       COUNT(*) AS customers,
       CAST(100.0 * SUM(CAST(Exited AS INT)) / COUNT(*) AS DECIMAL(5,1)) AS churn_percent
FROM Customers
GROUP BY Geography,
         CASE WHEN Age >= 40 THEN '40+' ELSE 'Under 40' END
ORDER BY Geography, age_band;

SELECT IsActiveMember,
       COUNT(*) AS customers,
       CAST(100.0 * SUM(CAST(Exited AS INT)) / COUNT(*) AS DECIMAL(5,1)) AS churn_percent
FROM Customers
GROUP BY IsActiveMember
ORDER BY IsActiveMember;