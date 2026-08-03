CREATE SCHEMA Book_store;

CREATE TABLE Book_store.Books(
	Book_ID SERIAL PRIMARY KEY,
	Title VARCHAR(100),
	Author  VARCHAR(100),
	Genre	 VARCHAR(50),
	Published_Year INT,
	Price NUMERIC(10,2),
	Stock INT
);

DROP TABLE IF EXISTS Book_store.customers;
CREATE TABLE Book_store.Customers(
	Customer_ID	SERIAL PRIMARY KEY,
	Name VARCHAR (100),
	Email VARCHAR (100),
	Phone VARCHAR (15),
	City VARCHAR (50),
	Country VARCHAR (150)
);

CREATE TABLE Book_store.Orders (
	Order_ID SERIAL PRIMARY KEY,
	Customer_ID INT REFERENCES Book_store.Customers(Customer_ID),
	Book_ID INT REFERENCES Book_store.Books(Book_ID),
	Order_Date DATE,
	Quantity INT,
	Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Book_store.Books;
SELECT * FROM Book_store.Customers;
SELECT * FROM Book_store.Orders;

-- Import Data into Books Table
COPY Book_store.Books
FROM 'C:/Users/Aditay Devkate/Desktop/projects/SQL projects/Online_book_store_Analysis/Books.csv'
DELIMITER ','
CSV HEADER;

-- Import Data into Customers Table
COPY Book_store.Customers
FROM "C:\Users\Aditay Devkate\Desktop\projects\SQL projects\Online_book_store_Analysis\Customers.csv"
CSV HEADER;

-- Import Data into Orders Table
COPY Book_store.orders
FROM "C:\Users\Aditay Devkate\Desktop\projects\SQL projects\Online_book_store_Analysis\Orders.csv"
DELIMITER ','
CSV HEADER;


-- Basic Queries

-- 1) Retrieve all books in the "Fiction" genre
SELECT * FROM Book_store.Books 
WHERE genre ='Fiction';

-- 2) Find books published after the year 1950
SELECT * FROM Book_store.Books 
WHERE published_year > 1950;

-- 3) List all customers from the Canada
SELECT * FROM Book_store.Customers
WHERE country = 'Canada';

-- 4) Show orders placed in November 2023
SELECT * FROM Book_store.Orders 
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available
SELECT SUM(stock) AS book_count
FROM Book_store.Books;

-- 6) Find the details of the most expensive book
SELECT * FROM  Book_store.Books
ORDER BY price DESC
LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of a book
SELECT * FROM Book_store.Orders
WHERE quantity > 1;

-- 8) Retrieve all orders where the total amount exceeds $20
SELECT * FROM Book_store.Orders
WHERE total_amount > 20;

-- 9) List all genres available in the Books table
SELECT DISTINCT genre 
FROM Book_store.Books;

-- 10) Find the book with the lowest stock
SELECT * FROM Book_store.Books
ORDER BY stock ASC;

-- 11) Calculate the total revenue generated from all orders
SELECT SUM(total_amount) AS Revenue
FROM Book_store.Orders;



-- Advance Queries


-- 1) Retrieve the total number of books sold for each genre
SELECT b.genre, o.quantity
FROM Book_store.Orders o
JOIN Book_store.Books b 
ON o.book_id = b.book_id;

-- 2) Find the average price of books in the "Fantasy" genre
SELECT AVG(price) AS Average_price
FROM Book_store.Books
WHERE genre ='Fantasy';

-- 3) List customers who have placed at least 2 orders
SELECT customer_id,COUNT(order_id) AS ORDER_COUNT
FROM  Book_store.Orders
GROUP BY customer_id
HAVING COUNT(order_id) >=2;

-- 4) Find the most frequently ordered book with book name
SELECT o.book_id, b.title ,COUNT(o.order_id) AS ORDER_COUNT
FROM Book_store.Orders o
JOIN  Book_store.Books b ON o.book_id = b.book_id
GROUP BY o.book_id, b.title
ORDER BY ORDER_COUNT DESC LIMIT 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre
SELECT * FROM Book_store.Books
WHERE genre = 'Fantasy'
ORDER BY price DESC LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author
SELECT b.author , SUM(o.quantity) AS Total_books_sold
FROM Book_store.Orders o
JOIN  Book_store.Books b ON o.book_id = b.book_id
GROUP BY b.author;

-- 7) List the cities where customers who spent over $30 are located
SELECT DISTINCT c.city , total_amount
FROM Book_store.Orders o
JOIN Book_store.Customers c ON o.customer_id = c.customer_id
WHERE o.total_amount >= 300;

-- 8) Find the customer who spent the most on orders
SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_spent
FROM  Book_store.Orders o
JOIN Book_store.Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC LIMIT 1;

-- 9) Calculate the stock remaining after fulfilling all order
SELECT b.book_id, b.title, b.stock,  COALESCE(SUM(o.quantity),0) AS order_quantity,
	b.stock - COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM Book_store.Books b
LEFT JOIN Book_store.Orders o ON b.book_id = o.book_id
GROUP BY b.book_id;

-- 10) Show the top 5 customers who placed the highest number of orders.
SELECT c.customer_id, c.name, count(o.order_id) AS total_orders
FROM Book_store.Customers c 
JOIN  Book_store.Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_orders DESC LIMIT 5;






