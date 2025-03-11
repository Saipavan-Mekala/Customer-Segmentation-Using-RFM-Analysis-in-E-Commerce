SELECT * FROM customer_data.sales;

# ADDED "R","F", "M" to assign the scores 
Alter table sales add column `R Score` Int;
Alter table sales add column `F Score` Int;
Alter table sales add column `M Score` Int;

# updating the table with R score
UPDATE sales set `R score` = 5 where `Recency (Days)`  between 0 and 10;
UPDATE sales set `R score` = 4 where `Recency (Days)`  between 11 and 30;
UPDATE sales set `R score` = 3 where `Recency (Days)`  between 31 and 60;
UPDATE sales set `R score` = 2 where `Recency (Days)`  between 61 and 90;
UPDATE sales set `R score` = 1 where `Recency (Days)` >=91 ;

# updating the table with F score
UPDATE sales set `F score` = 5 where `Frequency (Orders)`  >50;
UPDATE sales set `F score` = 4 where `Frequency (Orders)`  BETWEEN 21 AND 49;
UPDATE sales set `F score` = 3 where `Frequency (Orders)`  BETWEEN 10 AND 20;
UPDATE sales set `F score` = 2 where `Frequency (Orders)` BETWEEN 5 AND 9;
UPDATE sales set `F score` = 1 where `Frequency (Orders)`  <= 4;


# updating the table with M score
UPDATE sales set `M score` = 5 where `Monetary (Total Spend $)`  >=10000;
UPDATE sales set `M score` = 4 where `Monetary (Total Spend $)`  >=5001;
UPDATE sales set `M score` = 3 where `Monetary (Total Spend $)` >=1000 ;
UPDATE sales set `M score` = 2 where `Monetary (Total Spend $)` >=500;
UPDATE sales set `M score` = 1 where `Monetary (Total Spend $)` >=1 ;


# 1.  How many unique customers are there in the dataset?
SELECT COUNT(DISTINCT(CUSTOMER_ID)) FROM SALES;

# 2. What are the total sales and average order value (AOV)?
SELECT SUM(`Purchase_Amount ($)`) AS `TOTAL SALES`, avg(`Purchase_Amount ($)`) AS AOV FROM SALES;

#3.  Which payment method is most used by customers?
SELECT `Payment_Method`, COUNT(*) AS TOTAL FROM SALES GROUP BY `Payment_Method` order by TOTAL DESC;

# 4. What are the top 5 best-selling product categories?

SELECT Product_Category, SUM(`Purchase_Amount ($)`) AS `TOTAL SALES` FROM SALES GROUP BY Product_Category order by  `TOTAL SALES` DESC LIMIT 5;

# 5. Which customers have spent the most money? (Top 10 high-value customers)
SELECT Customer_Name , SUM(`Purchase_Amount ($)`) AS `TOTAL SALES` FROM SALES GROUP BY Customer_Name order by  `TOTAL SALES` DESC LIMIT 10;

 # 6. Which customers placed the most orders?
SELECT Customer_Name , COUNT(ORDER_ID) AS `TOTAL COUNT` FROM SALES GROUP BY Customer_Name order by  `TOTAL COUNT` DESC LIMIT 10;
 
#7.  Which city generates the highest revenue?
SELECT Location, SUM(`Purchase_Amount ($)`) AS Total_Revenue
FROM SALES
GROUP BY Location
ORDER BY Total_Revenue DESC;

# 8.COUNT THE RARE BUYERS

SELECT COUNT(Customer_Name) FROM SALES WHERE `R Score` <3 AND `F SCORE` <3 AND `M SCORE` <3;

# 9. COUNT THE LOYAL CUSTOMERS 
SELECT COUNT(Customer_Name) FROM SALES WHERE `R Score` <3 AND `F SCORE` <3 AND `M SCORE` <3;

# 10. COUNT VARIOUS CUSTOMERS BASED ON THERE M-SCORES

SELECT COUNT(CUSTOMER_ID) FROM SALES WHERE `M SCORE` = 5; #0 VIP CUSTOMERS
SELECT COUNT(CUSTOMER_ID) FROM SALES WHERE `F SCORE` = 4; #880 LOYAL CUSTOMERS
SELECT COUNT(CUSTOMER_ID) FROM SALES WHERE `R SCORE` = 5; #36 RECENT BUYERS
SELECT COUNT(CUSTOMER_ID) FROM SALES WHERE `F SCORE` = 2; #162 INFREQUENT BUYERS
SELECT COUNT(CUSTOMER_ID) FROM SALES WHERE `M SCORE` = 1; #1500 SMALL BUYERS



