CREATE DATABASE Sales_Project;
USE Sales_Project;

CREATE TABLE Orders (
    Order_ID INT,
    Order_Date DATE,
    Customer_ID INT,
    Product_ID INT,
    Region VARCHAR(50),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Shipping_Cost DECIMAL(10,2),
    Profit DECIMAL(10,2)
);


CREATE TABLE Products (
    Product_ID INT,
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Cost_Price DECIMAL(10,2)
);


CREATE TABLE Customers (
    Customer_ID INT,
    Segment VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50)
);


#Revenue Trend
SELECT 
    MONTH(Order_Date) AS Month,
    SUM(Sales) AS Total_Revenue
FROM Orders
GROUP BY MONTH(Order_Date)
ORDER BY Month;

#Profit Margin Trend
SELECT 
    MONTH(Order_Date) AS Month,
    SUM(Profit)/SUM(Sales)*100 AS Profit_Margin
FROM Orders
GROUP BY MONTH(Order_Date)
ORDER BY Month;

#Month-wise Average Discount
SELECT 
    MONTH(Order_Date) AS Month,
    AVG(Discount) AS Avg_Discount
FROM Orders
GROUP BY MONTH(Order_Date)
ORDER BY Month;

#Category Wise Margin
SELECT 
    P.Category,
    SUM(O.Sales) AS Revenue,
    SUM(O.Profit)/SUM(O.Sales)*100 AS Margin
FROM Orders O
JOIN Products P ON O.Product_ID = P.Product_ID
GROUP BY P.Category;

#Region
SELECT 
    Region,
    AVG(Shipping_Cost),
    SUM(Profit)/SUM(Sales)*100 AS Margin
FROM Orders
GROUP BY Region;