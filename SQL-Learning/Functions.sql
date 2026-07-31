--- SQL FUNSTIONS -- 

DROP TABLE IF EXISTS products;

SELECT * FROM products;

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10, 2),
    quantity INT,
    added_date DATE,
    discount_rate NUMERIC(5, 2)
);

INSERT INTO products
(product_name, category, price, quantity, added_date, discount_rate)
VALUES
('Laptop', 'Electronics', 75000.50, 10, '2024-01-15', 10.00),
('Smartphone', 'Electronics', 45000.99, 25, '2024-02-20', 5.00),
('Headphones', 'Accessories', 1500.75, 50, '2024-03-05', 15.00),
('Office Chair', 'Furniture', 5500.00, 20, '2023-12-01', 20.00),
('Desk', 'Furniture', 8000.00, 15, '2023-11-20', 12.00),
('Monitor', 'Electronics', 12000.00, 8, '2024-01-10', 8.00),
('Printer', 'Electronics', 9500.50, 5, '2024-02-01', 7.50),
('Mouse', 'Accessories', 750.00, 40, '2024-03-18', 10.00),
('Keyboard', 'Accessories', 1250.00, 35, '2024-03-18', 10.00),
('Tablet', 'Electronics', 30000.00, 12, '2024-02-28', 5.00);

----AGGREGATE FUNCTION--- 

--SUM()
-- Total Quantity Available of all products
SELECT SUM(quantity) AS quantity_sum
FROM Products;

-- SUM with condition 
SELECT SUM(quantity) AS quantity_of_ele
FROM products
WHERE category = 'Electronics' AND price > 20000;

--COUNT()
--total number of product
SELECT COUNT(*) AS total_product
FROM Products;

-- count with conditon 
SELECT COUNT(*) AS total_product
FROM Products 
WHERE product_name LIKE '%phone%';

--AVG ()
-- Average price of the products
SELECT AVG(price) AS average_price
FROM products;

-- Average price of the products with conditons
SELECT AVG(price) AS average_price
FROM products
WHERE category = 'Accessories' OR added_date > '2024-02-01';

-- MAX() 
-- Maximum and minimum price\
SELECT MAX(Price) AS max_price
FROM products;

 -- MIN()
SELECT MIN(Price) AS min_price
FROM products;


--- STRING FUNCTIONS ---

--UPPER() 
-- Get all the categories in uppercase 
SELECT UPPER(category)
FROM products;

--LOWER()
-- Get all the categories in lowercase 
SELECT LOWER (category)
FROM products;

--CONCAT()
--join product_name and category text with hypen 
SELECT CONCAT(product_name,'-',category) AS product_details
FROM products;

-- count length
SELECT product_name,LENGTH(product_name) AS COUNT_OF_CHAR
FROM products;

SELECT category,LENGTH(category) AS category_lenght
FROM products;

--SUBSTRING()
--extract the first characters from product_name
SELECT SUBSTRING(product_name,0,5) AS sub_name
FROM products;

--TRIM()
--remove leaing and training spaces
SELECT TRIM('    monitor       ') AS trimed_text
FROM products;

--REPLACE
-- Replace the word "phone" with "device"
SELECT REPLACE(product_name,'phone','device') AS replace_prod
FROM products;

--LEFT()
-- get the first 3 charaters frin category 
SELECT LEFT(product_name,3)
FROM products;

--RIGHT()
SELECT RIGHT(product_name,3)
FROM products;


---- DATE AND TIME ---

--NOW()
--get current Date and Time
SELECT NOW() AS CURRENT_DATETIME;

--CURRENT_DATE()
--get current date
SELECT CURRENT_DATE AS today_date;

SELECT Added_date,CURRENT_DATE,(CURRENT_DATE - added_date) AS days_diff
FROM products;


SELECT added_date,CURRENT_DATE,(CURRENT_DATE - added_date) AS days_dif
FROM products;

--EXTRACT()
-- EXTRACT parts of a date 
-- extract the year,month and day from the added_date column
SELECT product_name,
       EXTRACT(YEAR FROM added_date)AS year_added,
	   EXTRACT(MONTH FROM added_date)AS month_added,
	   EXTRACT(DAY FROM added_date)AS day_added
FROM products;

-- AGE()
--calculate Age Between Dates
--Calculate the time difference between added_date and today's date
SELECT product_name,
     AGE(CURRENT_DATE,added_date) AS Age_since_added
FROM products;

-- TO_CHAR()
--Format Dates as Strings
--Format added_date in a custom format(DD-Mon-YYYY)
SELECT product_name,
    TO_CHAR(added_date,'DD-Mon-YYYY') AS string_date
FROM products;

-- DATE_PART()
--get Specific Date part
--Extract the day of the week from added_date
SELECT product_name,added_date,
 		DATE_PART('dow',added_date) AS day_of_week
FROM products;

-- DATE_TRUNC()
--  Truncate Date to Precision
-- Truncate added_date to the start of the month
SELECT product_name, added_date,
		DATE_TRUNC('day',added_date) AS Month_start
FROM products;

-- INTERVAL()
-- Add or Subtract Time Intervals
-- Add 6 months to the added_date
SELECT product_name, added_date,
		added_date+INTERVAL '6 days' AS new_date
FROM products;

 -- CURRENT_TIME() 
--  Get Current Time
-- Retrieve only the current time
SELECT CURRENT_TIME AS current_time;

 -- TO_DATE() 
-- Convert String to Date
-- Convert a string to a date format
SELECT TO_DATE('28-11-2024','DD-MM-YYYY') AS converted_time



--- Conditional Function ---

--  CASE Function -
/* Categorizing Based on Conditions
We will categorize products into price ranges:
Expensive if the price is greater than or equal to 50,000.
Moderate if the price is between 10,000 and 49,999.
Affordable if the price is less than 10,000.
*/
SELECT product_name,price,
		CASE 
			WHEN price >= 50000 THEN 'Expensive'
			WHEN price >= 10000 AND price <= 49999 THEN 'Modrate'
			ELSE 'Affordable'
		END AS price_category
FROM products;


-- ASSIGNMENT QUESTION FOR CASE FUNCTION 

/* 2. CASE with AND & OR Operators - Stock Status
We will classify products based on quantity available:
In Stock if quantity is 10 or more.
Limited Stock if quantity is between 5 and 9.
Out of Stock Soon if quantity is less than 5.
*/
SELECT product_name,quantity,
		CASE
			WHEN quantity >=10 THEN 'In Stock'
			WHEN quantity BETWEEN 5 AND 9 THEN 'Limited Stock'
			ELSE  'Out od stock'
		END AS stock_status
FROM Products;


/* 3. CASE with LIKE Operator - Category Classification
Check if the category name contains "Electronics" or "Furniture" using LIKE.
*/
SELECT product_name,category,
		CASE 
			WHEN category LIKE 'Electronics%' THEN 'Electronics_Item'
			WHEN category LIKE 'Furniture%' THEN 'Furniture_Item'
			ELSE 'Accessory_Item'
		END AS category_type
FROM products;


-- COALESCE Function
SELECT * FROM products;
ALTER TABLE products
ADD COLUMN discount_price NUMERIC(10,2);

UPDATE products
SET discount_price = NULL 
WHERE product_name IN ('laptop','Desk');

UPDATE products
SET discount_price = price*0.9
WHERE product_name NOT IN ('Laptop','Desk');

SELECT product_name , price,discount_price
FROM Products;


SELECT product_name,price,
		COALESCE(discount_price,price) AS final_price
FROM products;


--- Window Function ---

-- Assign a unique row number to each product within the same category 
SELECT product_name,category,price,
		ROW_NUMBER() OVER (PARTITION BY category ORDER BY price DESC) AS row_num
		FROM products;

SELECT product_name,category,price,
		DENSE_RANK() OVER (PARTITION BY category ORDER BY price DESC) AS row_num
		FROM products;

SELECT product_name,category,price,
	    SUM(price) OVER (ORDER BY price DESC) AS Running_total
		FROM products;



