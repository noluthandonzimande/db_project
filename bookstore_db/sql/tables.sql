
-- Create table for books
-- This table stores the books of the company. 
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(13) UNIQUE,
    publication_year YEAR,
    price DECIMAL(10,2) NOT NULL,
    author VARCHAR(255) NOT NUll,
    cover_image VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    number_of_pages INT NOT NULL,
    synopsis TEXT NOT NULL,
    publication_date DATE NOT NULL,
    language_id INT,
    publisher_id INT,
    FOREIGN KEY (language_id) REFERENCES book_language(language_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

-- Create table for authors
-- This table stores the authors of the books. 
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    biography TEXT NOT NULL,
    date_of_birth DATE,
    nationality VARCHAR(255) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

-- Create table for book authors
-- This table stores the authors of the books. 
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES author(author_id) ON DELETE CASCADE
);

-- Create table for customers
-- This table stores the customers of the company. 
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT NOT NULL,
    date_of_birth DATE,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create table for address status
-- This table stores the status of the addresses. 
CREATE TABLE address_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT NOT NULL,
    validity_period INT NOT NULL,
    renewal_period INT NOT NULL
);

-- Create table for addresses   
-- This table stores the addresses of customers and other entities. 
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20),
    country_id INT,
    address_status_id INT NOT NULL,
    FOREIGN KEY (address_status_id) REFERENCES address_status(status_id),
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Create table for customer addresses
-- This table stores the addresses of customers and other entities. 
CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (address_id) REFERENCES address(address_id) ON DELETE CASCADE,
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);

-- Create table for shipping methods    
-- This table stores the shipping methods of the company. 
CREATE TABLE shipping_method (
    shipping_method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(50) NOT NULL,
    estimated_delivery_time INT NOT NULL,
    country_id INT NOT NULL,
    code VARCHAR(10) NOT NULL,
    region VARCHAR(255) NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Create table for order status
-- This table stores the status of the orders. 
CREATE TABLE order_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL UNIQUE
);

-- Create table for customer orders
-- This table stores the orders of the customers. 
CREATE TABLE customer_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME NOT NULL,
    shipping_method_id INT,
    status_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

-- Create table for order lines
-- This table stores the lines of the orders. 
CREATE TABLE order_line (
    order_id INT,
    book_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES customer_order(order_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- Create table for order history
-- This table stores the history of the orders. 
CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    status_id INT,
    status_date DATETIME NOT NULL,
    FOREIGN KEY (order_id) REFERENCES customer_order(order_id) ON DELETE CASCADE,
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

-- Create table for country
-- This table stores the countries of the world. 
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL UNIQUE
);

-- Create table for book language
-- This table stores the languages of the books. 
CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(50) NOT NULL 
);

-- Create table for publisher   
-- This table stores the publishers of the books. 
CREATE TABLE publisher (    
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(100) NOT NULL,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);
