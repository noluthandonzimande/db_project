
-- Query 1: List all books with their authors
-- This query lists all books with their authors. 
SELECT b.title, GROUP_CONCAT(CONCAT(a.first_name, ' ', a.last_name)) AS authors
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id
GROUP BY b.book_id;

-- Customer orders
-- This query lists all customer orders. 
SELECT c.first_name, o.order_id, o.order_date
FROM customer c
JOIN cust_order o ON c.customer_id = o.customer_id;

-- Total order value
-- This query lists the total order value for each order. 
SELECT o.order_id, SUM(ol.quantity * ol.price) AS total
FROM cust_order o
JOIN order_line ol ON o.order_id = ol.order_id
GROUP BY o.order_id;

-- Query 2: Find orders placed by a customer
-- This query lists all orders placed by a customer. 
SELECT o.order_id, o.order_date, os.status_name
FROM cust_order o
JOIN customer c ON o.customer_id = c.customer_id
JOIN order_status os ON o.status_id = os.status_id
WHERE c.email = 'john.doe@email.com';

-- Query 3: Calculate total revenue from orders
-- This query calculates the total revenue from orders. 
SELECT SUM(ol.quantity * ol.price) AS total_revenue
FROM order_line ol
JOIN cust_order o ON ol.order_id = o.order_id
WHERE o.status_id = (SELECT status_id FROM order_status WHERE status_name = 'Delivered');

-- Query 4: List customers with multiple addresses
-- This query lists customers with multiple addresses. 
SELECT c.first_name, c.last_name, COUNT(ca.address_id) AS address_count
FROM customer c
JOIN customer_address ca ON c.customer_id = ca.customer_id
GROUP BY c.customer_id
HAVING address_count > 1;

-- Books by publisher
-- This query lists the number of books published by each publisher. 
SELECT p.publisher_name, COUNT(b.book_id) AS book_count
FROM publisher p
LEFT JOIN book b ON p.publisher_id = b.publisher_id
GROUP BY p.publisher_id;

-- Orders by status
-- This query lists the number of orders by status. 
SELECT os.status_name, COUNT(o.order_id) AS order_count
FROM order_status os
LEFT JOIN cust_order o ON os.status_id = o.status_id
GROUP BY os.status_id;

-- Query 5: List books with their authors and publishers
-- This query lists all books with their authors and publishers. 
SELECT b.title, GROUP_CONCAT(CONCAT(a.first_name, ' ', a.last_name)) AS authors, p.publisher_name
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id
JOIN publisher p ON b.publisher_id = p.publisher_id
GROUP BY b.book_id;

-- Query 6: List authors with their books
-- This query lists all authors with their books. 
SELECT a.first_name, a.last_name, GROUP_CONCAT(b.title) AS books
FROM author a
JOIN book_author ba ON a.author_id = ba.author_id
JOIN book b ON ba.book_id = b.book_id
GROUP BY a.author_id;

-- Query 7: List publishers with their books
-- This query lists all publishers with their books.     
SELECT p.publisher_name, GROUP_CONCAT(b.title) AS books
FROM publisher p
LEFT JOIN book b ON p.publisher_id = b.publisher_id
GROUP BY p.publisher_id;

-- Query 8: List books by language
-- This query lists all books by language. 
SELECT b.title, l.language_name
FROM book b
JOIN book_language l ON b.language_id = l.language_id;

-- Query 9: List books by publication year      
-- This query lists all books by publication year. 
SELECT b.title, b.publication_year
FROM book b
ORDER BY b.publication_year;

-- Query 10: List books by price    
-- This query lists all books by price. 
SELECT b.title, b.price
FROM book b
ORDER BY b.price;

-- Query 11: List books by publication year and price   
-- This query lists all books by publication year and price. 
SELECT b.title, b.publication_year, b.price
FROM book b
ORDER BY b.publication_year, b.price;




