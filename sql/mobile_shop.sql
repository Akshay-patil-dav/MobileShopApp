-- =============================================
-- Mobile Shop Management System - Database Schema
-- =============================================

CREATE DATABASE IF NOT EXISTS mobile_shop_db;
USE mobile_shop_db;

-- Admin Table
CREATE TABLE admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(100),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Customers Table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    password VARCHAR(255) NOT NULL,
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    pincode VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Categories Table
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products Table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    brand VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    ram VARCHAR(50),
    storage VARCHAR(50),
    camera VARCHAR(100),
    battery VARCHAR(50),
    display_size VARCHAR(50),
    processor VARCHAR(100),
    os VARCHAR(50),
    description TEXT,
    image VARCHAR(255),
    category_id INT,
    stock INT DEFAULT 0,
    featured BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE SET NULL
);

-- Cart Table
CREATE TABLE cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT DEFAULT 1,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

-- Orders Table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    shipping_address TEXT,
    order_status VARCHAR(50) DEFAULT 'Pending',
    payment_method VARCHAR(50) DEFAULT 'COD',
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

-- Order Items Table
CREATE TABLE order_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

-- =============================================
-- Seed Data
-- =============================================

-- Default Admin (password: admin123)
INSERT INTO admin (username, password, full_name, email) VALUES
('admin', 'admin123', 'System Administrator', 'admin@mobileshop.com');

-- Sample Categories
INSERT INTO categories (category_name, description) VALUES
('Flagship', 'Premium flagship smartphones'),
('Mid-Range', 'Best value mid-range phones'),
('Budget', 'Affordable budget smartphones'),
('Gaming', 'High-performance gaming phones'),
('Foldable', 'Foldable screen smartphones');

-- Sample Products
INSERT INTO products (name, brand, price, ram, storage, camera, battery, display_size, processor, os, description, image, category_id, stock, featured) VALUES
('Galaxy S24 Ultra', 'Samsung', 129999.00, '12 GB', '256 GB', '200 MP + 12 MP + 50 MP + 10 MP', '5000 mAh', '6.8 inches', 'Snapdragon 8 Gen 3', 'Android 14', 'The ultimate Samsung flagship with S Pen, titanium frame, and AI-powered camera.', 'galaxy_s24_ultra.jpg', 1, 50, TRUE),
('iPhone 15 Pro Max', 'Apple', 159900.00, '8 GB', '256 GB', '48 MP + 12 MP + 12 MP', '4441 mAh', '6.7 inches', 'A17 Pro', 'iOS 17', 'Apple flagship with titanium design, Action button, and USB-C.', 'iphone_15_pro_max.jpg', 1, 40, TRUE),
('OnePlus 12', 'OnePlus', 64999.00, '12 GB', '256 GB', '50 MP + 64 MP + 48 MP', '5400 mAh', '6.82 inches', 'Snapdragon 8 Gen 3', 'Android 14', 'Hasselblad camera system with flagship performance.', 'oneplus_12.jpg', 1, 60, TRUE),
('Pixel 8 Pro', 'Google', 106999.00, '12 GB', '128 GB', '50 MP + 48 MP + 48 MP', '5050 mAh', '6.7 inches', 'Google Tensor G3', 'Android 14', 'Pure Google experience with AI-powered photography.', 'pixel_8_pro.jpg', 1, 35, TRUE),
('Samsung Galaxy A54', 'Samsung', 32999.00, '8 GB', '128 GB', '50 MP + 12 MP + 5 MP', '5000 mAh', '6.4 inches', 'Exynos 1380', 'Android 13', 'Great mid-range phone with flagship-level camera.', 'galaxy_a54.jpg', 2, 80, FALSE),
('Redmi Note 13 Pro+', 'Xiaomi', 29999.00, '12 GB', '256 GB', '200 MP + 8 MP + 2 MP', '5000 mAh', '6.67 inches', 'Dimensity 7200 Ultra', 'Android 13', '200MP camera champion in the mid-range segment.', 'redmi_note_13_pro.jpg', 2, 100, TRUE),
('Realme Narzo 60', 'Realme', 14999.00, '6 GB', '128 GB', '64 MP + 2 MP', '5000 mAh', '6.4 inches', 'Dimensity 6020', 'Android 13', 'Best budget phone with AMOLED display.', 'realme_narzo_60.jpg', 3, 120, FALSE),
('POCO M6 Pro', 'Xiaomi', 12999.00, '6 GB', '128 GB', '64 MP + 8 MP + 2 MP', '5000 mAh', '6.67 inches', 'Snapdragon 4 Gen 2', 'Android 13', 'Performance beast in the budget segment.', 'poco_m6_pro.jpg', 3, 90, FALSE),
('ASUS ROG Phone 8', 'ASUS', 104999.00, '16 GB', '256 GB', '50 MP + 13 MP + 5 MP', '5500 mAh', '6.78 inches', 'Snapdragon 8 Gen 3', 'Android 14', 'Ultimate gaming phone with AeroActive cooler.', 'rog_phone_8.jpg', 4, 25, TRUE),
('Samsung Galaxy Z Fold 5', 'Samsung', 154999.00, '12 GB', '256 GB', '50 MP + 10 MP + 12 MP', '4400 mAh', '7.6 inches', 'Snapdragon 8 Gen 2', 'Android 13', 'Premium foldable with multitasking capabilities.', 'galaxy_z_fold_5.jpg', 5, 20, TRUE);
