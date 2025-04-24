-- Create roles
-- This role is the admin role. 
CREATE ROLE admin_role, manager_role, clerk_role, user_role, contributer_role;

-- Grant Previledges to roles
-- This grants all previledges to the admin role. 
GRANT ALL ON bookstore_db.* TO admin_role;

-- This grants select, insert, update previledges to the manager role. 
GRANT SELECT, INSERT, UPDATE ON bookstore_db.book TO manager_role;
GRANT SELECT, INSERT, UPDATE ON bookstore_db.customer_order TO manager_role;
GRANT SELECT, INSERT, UPDATE ON bookstore_db.order_line TO manager_role;
GRANT SELECT, INSERT, UPDATE ON bookstore_db.customer TO manager_role;
GRANT SELECT, INSERT, UPDATE ON bookstore_db.book_author TO manager_role;
GRANT SELECT, INSERT, UPDATE ON bookstore_db.publisher TO manager_role;

-- This grants select previledges to the clerk role. 
GRANT SELECT ON bookstore_db.book TO clerk_role;
GRANT SELECT ON bookstore_db.customer_order TO clerk_role;
GRANT SELECT ON bookstore_db.order_line TO clerk_role;

-- This grants select previledges to the user role. 
GRANT SELECT ON bookstore_db.book TO user_role;
GRANT SELECT ON bookstore_db.book_language TO user_role;
GRANT SELECT ON bookstore_db.publisher TO user_role;
GRANT SELECT ON bookstore_db.author TO user_role;
GRANT SELECT ON bookstore_db.shipping_method TO user_role;
GRANT SELECT ON bookstore_db.user_orders_view TO user_role;

-- This grants select previledges to the contributer role. 
GRANT SELECT ON bookstore_db.book TO contributer_role;
GRANT SELECT ON bookstore_db.author TO contributer_role;
GRANT SELECT ON bookstore_db.book_author TO contributer_role;
GRANT SELECT ON bookstore_db.book_language TO contributer_role;
GRANT SELECT ON bookstore_db.publisher TO contributer_role;

-- Create view for user_role
-- This view is used to display the orders of the user. 
CREATE VIEW  user_orders_view AS 
SELECT order_id, order_date, status_id
FROM customer_order
WHERE customer_id = (SELECT customer_id FROM customer WHERE email = USER());

-- Create users
-- This creates the users for the roles. 
CREATE USER  'admin_user'@'localhost' IDENTIFIED BY 'AdminPass123!';
CREATE USER  'manager_user'@'localhost' IDENTIFIED BY 'ManagerPass123!';
CREATE USER  'clerk_user'@'localhost' IDENTIFIED BY 'ClerkPass123!';
CREATE USER  'customer_user'@'localhost' IDENTIFIED BY 'CustomerPass123!';
CREATE USER  'author_user'@'localhost' IDENTIFIED BY 'AuthorPass123!';


-- Assign roles to users
-- This assigns the roles to the users. 
GRANT admin_role TO 'admin_user'@'localhost';
GRANT manager_role TO 'manager_user'@'localhost';
GRANT clerk_role TO 'clerk_user'@'localhost';
GRANT user_role TO 'customer_user'@'localhost';
GRANT contributer_role TO 'author_user'@'localhost';


-- Activate roles by default
-- This activates the roles by default for the users. 
SET DEFAULT ROLE admin_role TO 'admin_user'@'localhost';
SET DEFAULT ROLE manager_role TO 'manager_user'@'localhost';
SET DEFAULT ROLE clerk_role TO 'clerk_user'@'localhost';
SET DEFAULT ROLE user_role TO 'customer_user'@'localhost';
SET DEFAULT ROLE contributor_role TO 'author_user'@'localhost';






