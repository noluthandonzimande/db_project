# Bookstore Database Project
## Project Overview

This project develops a MySQL relational database for a bookstore, designed to manage operations such as books, authors, customers, orders, and shipping. The system enables efficient data storage, retrieval, and analysis, and follows best practices in database design, normalization, and security. It demonstrates core skills in schema design, table creation, user role management, and analytical query development.

## Objectives

Design and implement a MySQL database for a bookstore with 15 interconnected tables.

Create an Entity-Relationship Diagram (ERD) using Draw.io to visualize relationships.

Define tables with appropriate data types, primary keys, foreign keys, and constraints (e.g., ON DELETE CASCADE).

Implement user roles for access control and data security.

Populate the database with sample data and test with realistic queries.


## Tools and Technologies

MySQL – Database management system.

Draw.io – ERD creation tool.

Git/GitHub – Version control and collaboration platform.


## Database Structure

The bookstore database consists of 15 tables covering the full scope of bookstore operations:

1. book – Book details (book_id, title, isbn, price, language_id, publisher_id)


2. book_author – Junction table linking books and authors (many-to-many)


3. author – Author details (author_id, first_name, last_name)


4. book_language – Supported languages (language_id, language_name)


5. publisher – Publisher info (publisher_id, publisher_name, country_id)


6. customer – Customer profiles (customer_id, first_name, last_name, email)


7. customer_address – Customer-address relationship


8. address_status – Address status options (status_id, status_name)


9. address – Address details (address_id, street, city, country_id)


10. country – List of countries (country_id, country_name)


11. customer_order – Customer orders (order_id, customer_id, order_date, status_id)


12. order_line – Items within orders (order_id, book_id, quantity, price)


13. shipping_method – Shipping options (shipping_method_id, method_name, cost)


14. order_history – Historical tracking of order status changes


15. order_status – Order status options (status_id, status_name)



Detailed schema and relationship documentation is provided in docs/schema_design.md.

### User Roles

Role-based access control is implemented to ensure appropriate permissions for different users:

admin_role – Full access (create, modify, delete, query)

manager_role – Read/write access to key operational tables; read-only for authors/publishers

clerk_role – Read-only access to orders and books

user_role – Read-only access to general data and a view of their own orders

contributor_role – Authors and contributors can manage their own records and related book data


Role definitions and permission tests are included in sql/user_roles.sql and docs/role_test_log.txt.

### Repository Structure
<pre>
   BookStore-Database-Group/
├── sql/
│   ├── create_database.sql      # Creates the bookstore database
│   ├── tables.sql               # Defines all tables
│   ├── user_roles.sql           # Sets up roles and users
│   ├── sample_data.sql          # Populates sample data
│   └── queries.sql              # Analytical queries for testing
├── diagrams/
│   └── bookstore_erd.png        # Exported ERD image
├── image/                       # Query outputs
├── README.md                    # This file
├── CONTRIBUTING.md              # Contribution guidelines
└── .gitignore                   # Ignores MySQL logs, temp files

</pre>


## Setup Instructions

To set up and explore the project locally:

### 1. Prerequisites
- [MySQL Community Server](https://dev.mysql.com/downloads/mysql/) (version 8.0 or later)
- [Draw.io](https://app.diagrams.net) (or connect with Google Drive to view ERDs)
- [Git](https://git-scm.com/downloads)

### 2. Clone the Repository
```bash
git clone https://github.com/Shacni/bookstore_db.git
cd bookstore_db

3. Set Up the Database

Run the following commands to set up the schema and sample data:

mysql -u root -p < sql/create_database.sql
mysql -u root -p < sql/tables.sql
mysql -u root -p < sql/user_roles.sql
mysql -u root -p < sql/sample_data.sql

Command Explanation:

mysql -u root -p – Log in as the MySQL root user (enter password when prompted).

create_database.sql – Initializes the bookstore database.

tables.sql – Creates all tables and constraints.

user_roles.sql – Defines user roles and permissions.

sample_data.sql – Inserts sample records into all key tables.


Contributing

Please follow the Git branching strategy:

1. Create a new branch:

git checkout -b <your-name>-task


2. Commit your changes with clear messages.


3. Push your branch and open a Pull Request.


4. All contributions are reviewed before merging.



For more details, see CONTRIBUTING.md.

### TEAM ROLES

Group Leader: (Samira): Tester & Documentation Lead
Focus: Testing scripts, writing queries, documenting results, and preparing submission.
Tools: MySQL for queries, GitHub for documentation, text editor.

Member: 1 (John Kinuthia): Schema Designer & ERD Lead
Focus: Designing the database schema, creating the ERD, and defining data types.
Tools: Draw.io, MySQL for schema validation.

Member: 3 (John Brown): SQL Developer & Data Lead
Focus: Writing SQL scripts for database/tables, user roles, and sample data.
Tools: MySQL Workbench or client, text editor for scripts.



