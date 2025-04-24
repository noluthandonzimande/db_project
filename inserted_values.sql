-- Insert brands
INSERT INTO brand (name, description, logo_url) VALUES
('Nike', 'Sportswear and equipment', 'https://example.com/logos/nike.png'),
('Adidas', 'Athletic wear and gear', 'https://example.com/logos/adidas.png');

-- Insert product categories
INSERT INTO product_category (name, description, parent_category_id) VALUES
('Clothing', 'Apparel and accessories', NULL),
('Shoes', 'All types of footwear', NULL),
('Sneakers', 'Casual sneakers', 2);

-- Insert colors
INSERT INTO color (name, hex_code) VALUES
('Red', '#FF0000'),
('Blue', '#0000FF'),
('Black', '#000000');

-- Insert size categories
INSERT INTO size_category (name, description) VALUES
('Clothing Sizes', 'Sizes for clothing'),
('Shoe Sizes', 'Sizes for shoes');

-- Insert size options
INSERT INTO size_option (size_category_id, value, description) VALUES
(1, 'S', 'Small'),
(1, 'M', 'Medium'),
(2, '8', 'UK Size 8'),
(2, '9', 'UK Size 9');

-- Insert products
INSERT INTO product (name, description, brand_id, category_id, base_price) VALUES
('Air Max Sneakers', 'Comfortable and stylish sneakers from Nike', 1, 3, 120.00),
('Adidas Hoodie', 'Warm and comfortable hoodie', 2, 1, 60.00);

-- Insert product images
INSERT INTO product_image (product_id, image_url, is_primary) VALUES
(1, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.footlocker.com.au%2Fen%2Fproduct%2Fmodel%2Fnike-air-max-1%2F64107.html&psig=AOvVaw3freXH8B3rllVgiyojxfJz&ust=1745607865489000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCIj6jpyu8YwDFQAAAAAdAAAAABAE', TRUE),
(2, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.zalando.de%2Fadidas-performance-m-fi-3s-hd-hoodie-medium-grey-heather-zzo30rk03-c11.html&psig=AOvVaw2P3AeAT5TJ22NRT97_t3aS&ust=1745607565521000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCKCjlIqt8YwDFQAAAAAdAAAAABAI', TRUE);

-- Insert product variations
INSERT INTO product_variation (product_id, color_id, size_option_id, price_adjustment, stock_quantity, sku) VALUES
(1, 3, 3, 0.00, 50, 'NIKE-AIRMAX-BLK-8'),
(1, 3, 4, 0.00, 30, 'NIKE-AIRMAX-BLK-9'),
(2, 1, 1, 0.00, 20, 'ADI-HOODIE-RED-S'),
(2, 1, 2, 0.00, 15, 'ADI-HOODIE-RED-M');

-- Insert attribute categories
INSERT INTO attribute_category (name, description) VALUES
('Material', 'Fabric or construction material'),
('Style', 'Fashion or sport style');

-- Insert attribute types
INSERT INTO attribute_type (name, data_type, attribute_category_id) VALUES
('Fabric Type', 'text', 1),
('Sport Type', 'text', 2);

-- Insert product attributes
INSERT INTO product_attribute (product_id, attribute_type_id, value) VALUES
(1, 1, 'Mesh & Rubber'),
(1, 2, 'Running'),
(2, 1, 'Cotton'),
(2, 2, 'Casual');

-- Insert product items (inventory)
INSERT INTO product_item (product_id, variation_id, sku, price, quantity) VALUES
(1, 1, 'NIKE-AIRMAX-BLK-8', 120.00, 50),
(1, 2, 'NIKE-AIRMAX-BLK-9', 120.00, 30),
(2, 3, 'ADI-HOODIE-RED-S', 60.00, 20),
(2, 4, 'ADI-HOODIE-RED-M', 60.00, 15);
