# walmart-sales-analysis
CREDITS- This is a guided project done with the help of the following youtube video https://youtu.be/Qr1Go2gP8fo?feature=shared

This was project aims to explore the Walmart Sales data to understand top performing branches and products, sales trend of of different products, customer behaviour. The aims is to study how sales strategies can be improved and optimized. The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition.

Purposes Of The Project
The major aim of thie project is to gain insight into the sales data of Walmart to understand the different factors that affect sales of the different branchesusing SQL.

About Data
The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition. This dataset contains sales transactions from a three different branches of Walmart, respectively located in Mandalay, Yangon and Naypyitaw. The data contains 17 columns and 1000 rows:


Approach Used
**Data Wrangling:** This is the first step where inspection of data is done to make sure NULL values and missing values are detected and data replacement methods are used to replace, missing or NULL values.
**Build a database:** Create table and insert the data.
Select columns with null values in them. There are no null values in our database as in creating the tables, we set NOT NULL for each field, hence null values are filtered out.
**Feature Engineering:** This will help use generate some new columns from existing ones.
Add a new column named time_of_day to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.
Add a new column named day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.
Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.
Exploratory Data Analysis (EDA): Exploratory data analysis is done to answer the listed questions and aims of this project.

**Conclusion:**

**Generic Question- **
How many unique cities does the data have? 
Ans- 3 cities
In which city is each branch? 
Ans- Yangon	A
     Naypyitaw C
     Mandalay	B

**Product Question- **
How many unique product lines does the data have? 
Ans- 6

What is the most common payment method? 
Ans- Cash

What is the most selling product line?
Ans- Fashion accessories	178

What is the total revenue by month?
Ans- January	116291.8680

What month had the largest COGS?
Ans- January	110754.16

What product line had the largest revenue?
Ans- Food and beverages	56144.8440

What is the city with the largest revenue?
Ans- Naypyitaw	110490.7755

What product line had the largest VAT?
Ans- Home and lifestyle	16.03033124

Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
Ans- Food and beverages	Bad
     Health and beauty	Bad
     Sports and travel	Bad
     Fashion accessories Bad
     Home and lifestyle	Bad
     Electronic accessories Bad

Which branch sold more products than average product sold?
Ans- A	1849

What is the most common product line by gender?
Ans- Female	Fashion accessories	96

What is the average rating of each product line?
Ans- 7.11	Food and beverages


Code
For the rest of the code, check the SQL_queries.sql file

-- Create database
CREATE DATABASE IF NOT EXISTS walmartSales;

-- Create table
CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);
