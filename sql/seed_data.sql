INSERT INTO categories (category_name, description, parent_category_id) VALUES
('Laptops & Computers', 'Desktop computers, laptops, and workstations', NULL),
('Mobile Devices', 'Smartphones, tablets, and wearables', NULL),
('Networking & Security', 'Network equipment and security devices', NULL),
('Software & Licenses', 'Development tools, operating systems, and software licenses', NULL),
('Gaming Laptops', 'High-performance gaming and development laptops', 1),
('Business Laptops', 'Professional workstations and business computers', 1),
('Mini PCs', 'Compact computers and single-board computers', 1),
('Smartphones', 'Android and iOS mobile devices', 2),
('Tablets', 'Professional tablets and 2-in-1 devices', 2),
('Smartwatches', 'Wearable technology and fitness trackers', 2),
('Routers & Switches', 'Network infrastructure equipment', 3),
('Security Cameras', 'IP cameras and surveillance systems', 3),
('Firewalls', 'Network security appliances', 3),
('Development IDEs', 'Professional development environments', 4),
('Operating Systems', 'Windows, Linux, and macOS licenses', 4),
('Antivirus Software', 'Security and protection software', 4);


INSERT INTO users (username, email, password_hash, first_name, last_name, phone, user_type)
VALUES 
('sipho_ndlovu', 'sipho.ndlovu@example.co.za', 'hashed_password_1', 'Sipho', 'Ndlovu', '082-345-6789', 'customer'),
('ayesha_patell', 'ayesha.patell@example.co.za', 'hashed_password_2', 'Ayesha', 'Patell', '083-456-7890', 'customer'),
('admin_ashley', 'admin.ashley@example.co.za', 'hashed_password_3', 'Ashley', 'Hove', '084-567-8901', 'admin'),
('thabo_mokoena', 'thabo.mokoena@example.co.za', 'hashed_password_4', 'Thabo', 'Mokoena', '072-678-9012', 'customer'),
('nomsa_khumalo', 'nomsa.khumalo@example.co.za', 'hashed_password_5', 'Nomsa', 'Khumalo', '073-789-0123', 'customer');



INSERT INTO products (
  product_name, description, category_id, price, cost_price, sku,
  stock_quantity, min_stock_level, weight, dimensions
)
VALUES
('MacBook Pro M3 16"', 'Professional laptop for developers', 5, 2499.99, 1999.99, 'MBP16M3001', 15, 5, 2.5, '35cm x 25cm x 1.6cm'),
('Dell XPS 13 Developer Edition', 'Ubuntu pre-installed developer laptop', 6, 1299.99, 1099.99, 'DELLXPS13001', 25, 5, 1.2, '30cm x 20cm x 1.5cm'),
('Raspberry Pi 5', 'Single-board computer for projects', 7, 89.99, 59.99, 'RPI5001', 100, 20, 0.05, '8.5cm x 5.6cm x 1.7cm'),
('iPhone 15 Pro', 'Latest professional smartphone', 8, 999.99, 799.99, 'IPH15PRO001', 50, 10, 0.2, '14.7cm x 7.1cm x 0.8cm'),
('iPad Pro 12.9"', 'Professional tablet for development', 9, 1099.99, 849.99, 'IPADPRO129001', 30, 5, 0.6, '28cm x 21cm x 0.6cm'),
('Apple Watch Series 9', 'Smartwatch for professionals', 10, 399.99, 299.99, 'APPLEWATCH9001', 60, 10, 0.07, '4.4cm x 3.8cm x 1.0cm'),
('ASUS AX6000 Router', 'High-performance Wi-Fi 6 router', 11, 299.99, 219.99, 'ASUSAX6000001', 40, 5, 0.8, '25cm x 20cm x 5cm'),
('Ubiquiti UniFi Camera', 'Professional security camera', 12, 199.99, 139.99, 'UNIFICAM001', 20, 5, 0.3, '10cm x 10cm x 6cm'),
('SonicWall Firewall', 'Enterprise network security', 13, 899.99, 699.99, 'SONICWALL001', 10, 2, 1.5, '30cm x 18cm x 4cm'),
('JetBrains IntelliJ IDEA', 'Professional Java IDE license', 14, 149.99, 0.00, 'INTELLIJ001', 500, 0, 0.0, 'Digital download'),
('Windows 11 Pro', 'Professional operating system', 15, 199.99, 0.00, 'WIN11PRO001', 500, 0, 0.0, 'Digital download'),
('Norton 360 Deluxe', 'Complete security suite', 16, 49.99, 0.00, 'NORTON360001', 500, 0, 0.0, 'Digital download');


INSERT INTO addresses (user_id, address_type, street_address, city, state, postal_code, country, is_default)
VALUES
(1, 'shipping', '123 Jeppe Street', 'Johannesburg', 'Gauteng', '2000', 'South Africa', TRUE),
(1, 'billing', '123 Jeppe Street', 'Johannesburg', 'Gauteng', '2000', 'South Africa', TRUE),
(2, 'shipping', '456 Musgrave Road', 'Durban', 'KwaZulu-Natal', '4001', 'South Africa', TRUE),
(2, 'billing', '456 Musgrave Road', 'Durban', 'KwaZulu-Natal', '4001', 'South Africa', TRUE),
(4, 'shipping', '789 Boshoff Street', 'Bloemfontein', 'Free State', '9301', 'South Africa', TRUE),
(5, 'shipping', '321 Long Street', 'Cape Town', 'Western Cape', '8001', 'South Africa', TRUE);

INSERT INTO orders (user_id, status, total_amount, shipping_cost, tax_amount, discount_amount, shipping_address_id, billing_address_id, payment_method, payment_status) VALUES
(1, 'delivered', 1029.98, 9.99, 82.00, 0.00, 1, 2, 'Credit Card', 'paid'),
(2, 'processing', 1319.98, 19.99, 105.60, 50.00, 3, 4, 'PayPal', 'paid'),
(4, 'shipped', 42.98, 4.99, 3.84, 0.00, 5, 5, 'Credit Card', 'paid'),
(5, 'pending', 79.99, 7.99, 7.04, 0.00, 6, 6, 'Credit Card', 'pending');

INSERT INTO order_items (order_id, product_id, quantity, unit_price, total_price) VALUES
(1, 1, 1, 999.99, 999.99),
(1, 5, 1, 29.99, 29.99),
(2, 3, 1, 1999.99, 1999.99),
(2, 4, 1, 1299.99, 1299.99),
(3, 5, 1, 29.99, 29.99),
(3, 7, 1, 12.99, 12.99),
(4, 6, 1, 79.99, 79.99);

INSERT INTO reviews (product_id, user_id, rating, title, comment, is_verified_purchase, helpful_count) VALUES
(1, 1, 5, 'Excellent laptop!', 'Great performance for development work.', TRUE, 15),
(1, 2, 4, 'Solid but pricey', 'Powerful but a bit expensive.', FALSE, 8),
(3, 2, 5, 'Perfect for projects', 'Ideal for DIY and prototyping.', TRUE, 12),
(5, 4, 3, 'Good tablet', 'Nice screen but battery life could be better.', TRUE, 3),
(7, 5, 5, 'Fast router', 'Excellent speed and coverage.', FALSE, 25);

INSERT INTO cart_items (user_id, product_id, quantity) VALUES
(1, 2, 1),
(1, 8, 2),
(2, 6, 1),
(4, 3, 1),
(5, 7, 3);
