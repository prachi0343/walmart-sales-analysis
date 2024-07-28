-- -----------------------GENERIC QUESTIONS---------------------
-- --------q-1-How many unique cities does the data have?-----------------
SELECT DISTINCT city
FROM sales;
-- ----------q-2-In which city is each branch?-------------
SELECT DISTINCT city, branch 
FROM sales;
-- -----------------------PRODUCT QUESTIONS---------------------

-- ------q-1-How many unique product lines does the data have?-----
SELECT DISTINCT product_line
FROM sales;
-- ----q-2-What is the most common payment method?-----
SELECT payment_method, count(payment_method) AS cnt
FROM sales
GROUP BY payment_method
ORDER BY cnt DESC;
-- --------------------q-3-What is the most selling product line?--------
SELECT product_line, count(product_line) AS cnt
FROM sales
GROUP BY product_line
ORDER BY cnt DESC;
-- --------------------q-4-What is the total revenue by month?-----
SELECT month_name AS month, SUM(total) AS totalrevenue
FROM sales
GROUP BY month_name
ORDER BY totalrevenue DESC;

-- -----q-5-What month had the largest COGS?-----
SELECT month_name AS month, sum(cogs) AS cogs
FROM sales
GROUP BY month_name
ORDER BY cogs DESC;

-- ----q-6-What product line had the largest revenue?-----
SELECT product_line AS productline, sum(total) AS sum
FROM sales
GROUP BY product_line
ORDER BY sum DESC;

-- --------q-7-What is the city with the largest revenue?-----
SELECT branch, city AS city, sum(total) AS sum
FROM sales
GROUP BY city, branch
ORDER BY sum DESC;

-- ----q-8-What product line had the largest VAT?-----
SELECT product_line, AVG(VAT) AS VAT
FROM sales
GROUP BY product_line
ORDER BY VAT DESC;


-- --q-9-Which branch sold more products than average product sold?------- --------------------questions-10------
SELECT branch, SUM(quantity) AS qty
FROM sales
GROUP BY branch
HAVING SUM(quantity)> (SELECT AVG (quantity) FROM sales);

-- q-10-What is the most common product line by gender
SELECT
	gender,
    product_line,
    COUNT(gender) AS total_cnt
FROM sales
GROUP BY gender, product_line
ORDER BY total_cnt DESC;

-- q-11---What is the average rating of each product line
SELECT
	ROUND(AVG(rating), 2) as avg_rating,
    product_line
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;
-- q-12--Fetch each product line and add a column to those product 
-- line showing "Good", "Bad". Good if its greater than average sales

SELECT 
	AVG(quantity) AS avg_qnty
FROM sales;

SELECT
	product_line,
	CASE
		WHEN AVG(quantity) > 6 THEN "Good"
        ELSE "Bad"
    END AS remark
FROM sales
GROUP BY product_line;
