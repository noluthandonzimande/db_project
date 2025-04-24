# E-Commerce Database Project

This project contains the SQL scripts for setting up and populating an e-commerce database. The database is designed to manage products, brands, categories, attributes, variations, and inventory for an e-commerce platform.

## Project Structure

- **`e-commerce.sql`**: Contains the schema definitions for the database, including tables, relationships, and constraints.
- **`inserted_values.sql`**: Contains the SQL scripts to populate the database with sample data.

## Database Schema

The database includes the following tables:

1. **Brand**: Stores information about product brands.
2. **Product Category**: Supports hierarchical categories for products.
3. **Product**: Stores product details, including brand and category relationships.
4. **Product Image**: Stores URLs for product images.
5. **Color**: Stores color options for products.
6. **Size Category**: Defines categories for sizes (e.g., clothing sizes, shoe sizes).
7. **Size Option**: Stores specific size options for each size category.
8. **Product Variation**: Tracks variations of products (e.g., color, size).
9. **Attribute Category**: Groups product attributes into categories.
10. **Attribute Type**: Defines specific attributes for products (e.g., material, style).
11. **Product Attribute**: Stores attribute values for products.
12. **Product Item**: Tracks inventory for specific product variations.

## Sample Data

The `inserted_values.sql` file includes sample data for:

- Brands (e.g., Nike, Adidas)
- Product categories (e.g., Clothing, Shoes, Sneakers)
- Colors (e.g., Red, Blue, Black)
- Size categories and options
- Products and their variations
- Product attributes (e.g., Fabric Type, Sport Type)
- Inventory items

## How to Use

1. **Set up the database:**
   - Run the `e-commerce.sql` script to create the database schema.

   ```bash
   mysql -u [username] -p < e-commerce.sql