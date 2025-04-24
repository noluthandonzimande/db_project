
-- This inserts the sample data into the core tables. 
INSERT INTO book (
    title,
    isbn,
    publication_year,
    publication_date,
    price,
    author,
    cover_image,
    category,
    number_of_pages,
    synopsis,
    language_id,
    publisher_id
)
VALUES 
('The Great Gatsby', '9780743273565', 1925, '1925-04-10', 9.99, 'F. Scott Fitzgerald', 'gatsby.jpg', 'Classic', 180, 'A story of wealth, love, and the American dream.', 1, 1),
('1984', '9780451524935', 1949, '1949-06-08', 12.99, 'George Orwell', '1984.jpg', 'Dystopian', 328, 'A dystopian novel about surveillance and oppression.', 1, 2),
('The Handmaid''s Tale', '9780385490818', 1985, '1985-03-16', 15.99, 'Margaret Atwood', 'handmaid.jpg', 'Dystopian', 311, 'A tale of oppression in a totalitarian regime.', 1, 3);

-- This inserts the sample data into the author table. 
INSERT INTO author (first_name, last_name, biography, date_of_birth, nationality)
VALUES ('F. Scott', 'Fitzgerald', 'American novelist known for The Great Gatsby.', '1896-09-24', 'American'),
       ('George', 'Orwell', 'British writer famous for dystopian works like 1984.', '1903-06-25', 'British'),
       ('Margaret', 'Atwood', 'Canadian author of speculative fiction.', '1939-11-18', 'Canadian');

-- This inserts the sample data into the book_author table.     
INSERT INTO book_author (book_id, author_id)
VALUES (1, 1),  -- Gatsby by Fitzgerald
       (2, 2),  -- 1984 by Orwell
       (3, 3);  -- Handmaid's Tale by Atwood

-- This inserts the sample data into the customer table. 
INSERT INTO customer (first_name, last_name, email, address, phone, date_of_birth)
VALUES ('John', 'Doe', 'john.doe@email.com', '123 Maple St, New York, NY 10001', '555-0101', '1990-05-15'),
       ('Jane', 'Smith', 'jane.smith@email.com', '456 Oak Ave, London, SW1A 1AA', '555-0102', '1985-08-22'),
       ('Alice', 'Brown', 'alice.brown@email.com', '789 Pine Rd, Toronto, M5V 2T6', '555-0103', '1995-03-10');

-- This inserts the sample data into the address table. 
INSERT INTO address (street, city, postal_code, country_id)
VALUES ('123 Main St', 'Mombasa', '80100', 1),
       ('456 High St', 'Nairobi', '00100', 2);

-- This inserts the sample data into the customer_address table. 
INSERT INTO customer_address (customer_id, address_id, status_id)
VALUES (1, 1, 1), (2, 2, 1);

-- This inserts the sample data into the cust_order table. 
INSERT INTO cust_order (customer_id, order_date, shipping_method_id, status_id)
VALUES (1, '2025-04-10 10:00:00', 1, 1);

-- This inserts the sample data into the order_line table. 
INSERT INTO order_line (order_id, book_id, quantity, price)
VALUES (1, 1, 2, 9.99);

-- This inserts the sample data into the order_history table. 
INSERT INTO order_history (order_id, status_id, status_date)
VALUES (1, 1, '2025-04-10 10:00:00');


-- This inserts the sample data into the country table.     
INSERT INTO country (country_name) VALUES ('USA'), ('UK'), ('Canada');

-- This inserts the sample data into the book_language table.   
INSERT INTO book_language (language_name) VALUES ('English'), ('Spanish');

-- This inserts the sample data into the publisher table.   
INSERT INTO publisher (publisher_name, country_id) VALUES ('Penguin Books', 1), ('Random House', 1);

-- This inserts the sample data into the address_status table.      
INSERT INTO address_status (status_name) VALUES ('Current'), ('Old');

-- This inserts the sample data into the order_status table.     
INSERT INTO order_status (status_name) VALUES ('Pending'), ('Shipped'), ('Delivered');

-- This inserts the sample data into the shipping_method table.       
INSERT INTO shipping_method (method_name, cost) VALUES ('Standard', 5.00), ('Express', 15.00);
