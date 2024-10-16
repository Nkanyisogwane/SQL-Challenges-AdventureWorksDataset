SQL Query Challenges Repository

Overview
This repository contains a collection of SQL queries designed to address various business scenarios and analytical problems using AdventureWorks database tables. Each challenge focuses on different aspects of SQL, including basic joins, aggregations, subqueries, ranking functions, and window operations. The goal of these challenges is to provide practical examples of SQL for learning and testing purposes.

Prerequisites

To run these queries, you need:
•	SQL Server Management Studio (SSMS) or any compatible SQL client.
•	The AdventureWorks database properly installed and configured.

Structure of the Challenges
The challenges are grouped by complexity and target different SQL skills. Each query is formatted to focus on a particular business question, from analyzing employee data to evaluating sales performance.

Challenge 1: Basic Employee Information
•	Involves basic SELECT statements and simple JOINs to extract details about employees, their departments, and pay history.
•	Key Tables Used: HumanResources.Employee, HumanResources.EmployeeDepartmentHistory, HumanResources.EmployeePayHistory, HumanResources.Department.

•	Examples:
o	Extract employee information with department names.
o	Calculate average pay rate by department.

Challenge 2: Employee Salary Analysis
•	Focuses on analyzing pay history and changes over time using aggregation and GROUP BY clauses.
•	Key Tables Used: HumanResources.Employee, HumanResources.EmployeeDepartmentHistory, HumanResources.EmployeePayHistory.
•	Examples:
o	Calculate salary trends and average salaries by department.
o	Determine starting and current salaries for employees and compute salary increases.

Challenge 3: Customer Purchase Analysis
•	Includes queries to determine customer purchase behavior and unique customer counts over time.
•	Key Tables Used: Sales.Customer, Sales.SalesOrderHeader.
•	Examples:
o	Calculate total purchases for each customer.
o	Count distinct customers per month.

Challenge 4: Product Inventory Management
•	Analyzes product inventory levels, safety stock, and order quantities using JOINs and GROUP BY.
•	Key Tables Used: Production.Product, Production.ProductInventory, Purchasing.PurchaseOrderDetail.
•	Examples:
o	Calculate average inventory per product.
o	Identify products with inventory below safety stock levels.

Challenge 5: Sales Performance Analysis
•	Focuses on sales data aggregation, utilizing GROUP BY, ROLLUP, and window functions.
•	Key Tables Used: Sales.SalesOrderHeader.
•	Examples:
o	Calculate monthly and quarterly sales.
o	Forecast future sales using LEAD and other window functions.

Challenge 6: Employee Performance Ranking
•	Uses window functions (RANK, ROW_NUMBER) to rank employees based on their pay rates.
•	Key Tables Used: HumanResources.Employee, HumanResources.EmployeePayHistory, Person.Person.
•	Examples:
o	Rank employees based on current pay rates.
o	Identify latest salaries for employees using ROW_NUMBER.

Challenge 7: Customer Transaction Analysis
•	Analyzes customer transaction history, including purchase patterns and frequency.
•	Key Tables Used: Sales.Customer, Production.TransactionHistory.
•	Examples:
o	Calculate total quantity purchased and number of transactions per customer.
o	Determine months since the last purchase for each customer.

Challenge 8: Advanced Sales Analysis
•	Utilizes more complex queries involving PIVOT operations and dynamic SQL.
•	Key Tables Used: Sales.SalesOrderHeader, Sales.SalesOrderDetail, Production.Product.
•	Examples:
o	Calculate monthly sales per product.
o	Use dynamic SQL to group sales by year and month.

Challenge 9: Product and Vendor Analysis
•	Focuses on vendor performance and product inventory management.
•	Key Tables Used: Purchasing.ProductVendor, Purchasing.PurchaseOrderDetail, Purchasing.Vendor.
•	Examples:
o	Identify delayed deliveries and calculate delivery delays.
o	Create non-clustered indexes to optimize queries.

How to Use
1.	Clone the repository:
git clone https://github.com/your-username/AdventureWorks-Challenges.git
2.	Open the SQL script files in your preferred SQL client.
3.	Make sure the USE AdventureWorks; statement is included at the beginning of each script.
4.	Run each query block-by-block to see the results and understand the logic.


Contribution Guidelines
If you have additional SQL challenges or want to suggest improvements:
•	Fork the repository.
•	Create a new branch (feature/your-feature-name).
•	Submit a pull request.
License
This project is licensed under the MIT License. See the LICENSE file for more details.


