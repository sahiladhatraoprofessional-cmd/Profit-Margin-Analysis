#Revenue Trend

SELECT 
    MONTH(Order_Date) AS Month,
    SUM(Sales) AS Total_Revenue
FROM Orders
GROUP BY MONTH(Order_Date)
ORDER BY Month;
