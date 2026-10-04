# 📦 DataCo Supply Chain & Logistics SQL Analysis

## 📌 Executive Summary
This project presents an end-to-end data analysis of DataCo's supply chain dataset (~180,000 records) using **SQL Server Express** and **SSMS**. The primary goal is to evaluate commercial performance across markets and identify key operational risks, specifically shipping delays and supply chain bottlenecks.

## 📊 Key Performance Indicators (KPIs)
- **Total Orders Processed:** 180,519
- **Total Revenue (Sales):** $33,054,402.38
- **Total Net Profit:** $3,966,902.97

## 🔍 Key Insights & Business Findings
1. **Shipping Bottlenecks (Operational Risk):** Over **54% of total orders (~98,977 orders)** experienced late delivery (`Late delivery`), accounting for more than **$18.08M** in revenue.
2. **Top Product Categories:** The `Fishing` category generated the highest profit ($756k), while `Cleats` recorded the highest order volume (24,551 orders).
3. **Preferred Payment Methods:** `DEBIT` and `TRANSFER` represent the majority of customer transactions (~65%+ of sales volume).
4. **Geographic Distribution:** `Europe` and `LATAM` lead in global sales, with the United States (`Estados Unidos`) being the top country by total sales ($4.38M).

## 💡 Business Recommendations
- **Carrier Diversification:** Partner with local regional carriers in high-volume regions to mitigate the >50% late delivery rate in core product categories (`Cleats`, `Men's Footwear`, `Women's Apparel`).
- **Inventory Buffer Management:** Implement automated stock replenishment triggers for top-demand categories during peak purchasing cycles.

## 🛠️ Tech Stack & Methods
- **Database Engine:** Microsoft SQL Server
- **IDE:** SQL Server Management Studio (SSMS)
- **SQL Techniques Used:** `TRY_CAST`, Aggregate Functions (`SUM`, `COUNT`), Conditional Aggregation (`CASE WHEN`), Data Grouping (`GROUP BY`), Conditional Filtering (`HAVING`), Sorting & Ranking (`ORDER BY`, `TOP`).
