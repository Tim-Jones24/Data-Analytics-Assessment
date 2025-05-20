# Data-Analytics-Assessment
A detailed submission of a Data Analytics Assessment for Cowry wise

##  Overview

This repository documents a structured SQL assessment where I explored customer and transaction data using **MySQL Workbench**. The goal was to extract valuable business insights such as identifying high-value customers, analyzing transaction behavior, tracking account activity, and estimating customer lifetime value (CLV).

All queries were written in SQL, and I leveraged **Common Table Expressions (CTEs)**, **JOINs**, **aggregate functions**, and **window functions** to efficiently analyze the data and generate results.


## 🛠️ Tools & Technologies Used

- **Database Tool**: MySQL Workbench
- **Language**: SQL
- **Techniques Applied**:
- Common Table Expressions (CTEs)
- INNER JOINs
- Window Functions (`ROW_NUMBER`)
- Aggregate Functions (`SUM`, `AVG`, `COUNT`)
- Date Calculations & Conditional Logic (`CASE`, `DATEDIFF`, `EXTRACT`)


## ⚙️ Setup & Preparation

Before analysis, I:

1. **Imported the dataset** into MySQL Workbench using the SQL Query Window.
2. **Explored table relationships** to understand how they connect (e.g., users_customeruser, savings accounts, plans_plan).
3. Took time to understand data semantics (e.g., `is_fixed_investment`, `confirmed_amount`) to ensure accurate results.


## SQL Assessment Tasks

Each question below addresses a specific business goal and is broken down into:

- **Task** (What the question is about)
- **Approach** (How I solved it)
- **Key SQL Concepts Used**
- **Outcome** (Records derived)


###  Question 1: High-Value Customers with Multiple Products

** Task**  
Identify customers who have **at least one funded savings plan** and **one funded investment plan**, and rank them based on their total deposits.

** Approach**  
- Combined customer first and last names using `CONCAT`.
- Filtered the dataset to include only customers with both plan types (`is_regular_savings = 1` and `is_fixed_investment = 1`).
- Summed the `confirmed_amount` (i.e., deposited funds).
- Used INNER JOINs to connect related tables: users, savings accounts, and plans.
- Grouped data by customer and sorted by total deposits in descending order.

** SQL Concepts Used**  
JOINs | Aggregation | WHERE Filtering | GROUP BY | ORDER BY

** Output**  
`16` high-value customer records identified.


###  Question 2: Transaction Frequency Analysis

** Task**  
Calculate the **average number of transactions per customer per month**, and **categorize** customers based on their frequency of transactions.

** Approach**  
- Extracted `year` and `month` from the transaction date using the `EXTRACT()` function.
- Grouped by user and month to count monthly transactions.
- Calculated the average transaction count per customer.
- Used `CASE` to categorize customers as "Low", "Medium", or "High Frequency" based on thresholds.
- Joined necessary tables and ordered by year, month, and average count.

** SQL Concepts Used**  
Date Functions | Aggregation | CASE Statement | JOINs

** Output**  
`8,210` records showing categorized transaction frequency.

###  Question 3: Account Inactivity Alert

** Task**  
Identify **active savings or investment accounts** that have had **no transactions in the past 365 days**.

**🔍 Approach**  
- Used a `ROW_NUMBER()` window function to rank transactions by recency per account.
- Extracted only the latest transaction for each account.
- Filtered out accounts with last activity over a year ago using `DATEDIFF()`.
- Ensured only **active accounts** were included in the results.

** SQL Concepts Used**  
Window Functions | CTEs | Date Filtering | JOINs

** Output**  
`2,458` inactive active accounts identified for potential re-engagement.

---

###  Question 4: Customer Lifetime Value (CLV) Estimation

** Task**  
Estimate the **Customer Lifetime Value (CLV)** based on the assumption that **each transaction generates 0.1% profit**.

** Approach**  
- Calculated `CLV = SUM(confirmed_amount) * 0.001` per customer.
- Merged customer details (name, join date) with savings data.
- Counted the total number of transactions per customer.
- Used a **CTE** to simplify the CLV logic.
- Grouped and ordered by highest CLV to identify top-performing customers.

** SQL Concepts Used**  
CTEs | Aggregation | JOINs | Calculated Fields | Sorting

** Output**  
`873` customer CLV records estimated.

---

##  Learnings & Key Takeaways

- MySQL Workbench enabled smooth data exploration and relational querying.
- Using **CTEs** and **window functions** made complex queries easier to manage and interpret.
- Understanding the business logic behind each task was crucial to correctly framing the SQL queries.
- This assessment reflects real-world BI and analytics scenarios like churn detection, segmentation, and customer value analysis.



