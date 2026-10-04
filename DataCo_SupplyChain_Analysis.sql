-- ============================================================
-- Project: DataCo Supply Chain & Logistics Analytics
-- Tool: Microsoft SQL Server / SSMS
-- Author: Hassan Mahmoud
-- Description: End-to-end SQL analysis on 180k+ supply chain records, 
--              identifying sales KPIs, shipping bottlenecks, and category performance.
-- ============================================================

USE DataCo_SupplyChain;
GO

-- 1. Executive Summary KPIs (Total Orders, Sales, and Profit)
SELECT 
    COUNT(*) AS Total_Orders,
    ROUND(SUM(TRY_CAST(Sales_per_customer AS FLOAT)), 2) AS Total_Sales,
    ROUND(SUM(TRY_CAST(Benefit_per_order AS FLOAT)), 2) AS Total_Profit
FROM DataCoSupplyChainDataset;

-- 2. Delivery Performance & Shipping Status Breakdown
SELECT 
    Delivery_Status,
    COUNT(*) AS Total_Orders,
    ROUND(SUM(TRY_CAST(Sales_per_customer AS FLOAT)), 2) AS Total_Sales
FROM DataCoSupplyChainDataset
GROUP BY Delivery_Status
ORDER BY Total_Orders DESC;

-- 3. Product Category Analysis (Top Sales & Profitability)
SELECT TOP 5 
    Category_Name,
    COUNT(*) AS Total_Orders,
    ROUND(SUM(TRY_CAST(Sales_per_customer AS FLOAT)), 2) AS Total_Sales,
    ROUND(SUM(TRY_CAST(Benefit_per_order AS FLOAT)), 2) AS Total_Profit
FROM DataCoSupplyChainDataset
GROUP BY Category_Name
ORDER BY Total_Sales DESC;

-- 4. Payment Methods Distribution
SELECT 
    Type AS Payment_Method,
    COUNT(*) AS Total_Orders,
    ROUND(SUM(TRY_CAST(Sales_per_customer AS FLOAT)), 2) AS Total_Sales,
    ROUND(SUM(TRY_CAST(Benefit_per_order AS FLOAT)), 2) AS Total_Profit
FROM DataCoSupplyChainDataset
GROUP BY Type
ORDER BY Total_Sales DESC;

-- 5. Geographic Market Analysis
SELECT 
    Market,
    COUNT(*) AS Total_Orders,
    ROUND(SUM(TRY_CAST(Sales_per_customer AS FLOAT)), 2) AS Total_Sales,
    ROUND(SUM(TRY_CAST(Benefit_per_order AS FLOAT)), 2) AS Total_Profit
FROM DataCoSupplyChainDataset
GROUP BY Market
ORDER BY Total_Sales DESC;

-- 6. Top 10 Order Countries by Sales
SELECT TOP 10 
    Order_Country,
    COUNT(*) AS Total_Orders,
    ROUND(SUM(TRY_CAST(Sales_per_customer AS FLOAT)), 2) AS Total_Sales,
    ROUND(SUM(TRY_CAST(Benefit_per_order AS FLOAT)), 2) AS Total_Profit
FROM DataCoSupplyChainDataset
GROUP BY Order_Country
ORDER BY Total_Sales DESC;

-- 7. Operational Risk Analysis: Late Deliveries by Category
SELECT TOP 10
    Category_Name,
    COUNT(*) AS Total_Orders,
    SUM(CASE WHEN Delivery_Status = 'Late delivery' THEN 1 ELSE 0 END) AS Late_Orders,
    ROUND(SUM(TRY_CAST(Benefit_per_order AS FLOAT)), 2) AS Net_Profit
FROM DataCoSupplyChainDataset
GROUP BY Category_Name
HAVING SUM(TRY_CAST(Benefit_per_order AS FLOAT)) < 0 
    OR SUM(CASE WHEN Delivery_Status = 'Late delivery' THEN 1 ELSE 0 END) > 5000
ORDER BY Late_Orders DESC;
