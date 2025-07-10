# Ecommerce Database Schema Documentation

This document describes the structure and relationships of the MySQL database schema for the ecommerce project.

## Database Setup

- The schema drops and recreates the `ecommerce_db` database to ensure a clean setup.
- All tables are created within this database.

## Tables Overview

### 1. `users`

Stores user account information.

- Fields: `user_id`, `username`, `email`, `password_hash`, `first_name`, `last_name`, `phone`, `date_registered`, `last_login`, `is_active`, `user_type`
- Relationships: Referenced by `addresses`, `orders`, `cart_items`, `reviews`, `inventory_logs`

### 2. `categories`

Product categories, supporting parent-child relationships.

- Fields: `category_id`, `category_name`, `description`, `parent_category_id`, `created_at`, `is_active`
- Relationships: Self-referencing for nested categories; referenced by `products`

### 3. `products`

Product catalog.

- Fields: `product_id`, `product_name`, `description`, `category_id`, `price`, `cost_price`, `sku`, `stock_quantity`, `min_stock_level`, `weight`, `dimensions`, `created_at`, `updated_at`, `is_active`
- Relationships: References `categories`; referenced by `order_items`, `cart_items`, `reviews`, `inventory_logs`

### 4. `addresses`

Stores customer addresses (billing/shipping).

- Fields: `address_id`, `user_id`, `address_type`, `street_address`, `city`, `state`, `postal_code`, `country`, `is_default`, `created_at`
- Relationships: References `users`; referenced by `orders`

### 5. `orders`

Customer orders.

- Fields: `order_id`, `user_id`, `order_date`, `status`, `total_amount`, `shipping_cost`, `tax_amount`, `discount_amount`, `shipping_address_id`, `billing_address_id`, `payment_method`, `payment_status`, `notes`
- Relationships: References `users`, `addresses`; referenced by `order_items`

### 6. `order_items`

Items within an order.

- Fields: `order_item_id`, `order_id`, `product_id`, `quantity`, `unit_price`, `total_price`
- Relationships: References `orders`, `products`

### 7. `cart_items`

Shopping cart contents for users.

- Fields: `cart_id`, `user_id`, `product_id`, `quantity`, `added_at`
- Relationships: References `users`, `products`

### 8. `reviews`

Product reviews by users.

- Fields: `review_id`, `product_id`, `user_id`, `rating`, `title`, `comment`, `review_date`, `is_verified_purchase`, `helpful_count`
- Relationships: References `products`, `users`

### 9. `inventory_logs`

Tracks inventory changes for products.

- Fields: `log_id`, `product_id`, `change_type`, `quantity_change`, `old_quantity`, `new_quantity`, `reason`, `created_at`, `created_by`
- Relationships: References `products`, `users`

## Relationships Diagram

- **users** ← addresses, orders, cart_items, reviews, inventory_logs
- **categories** ← products
- **products** ← order_items, cart_items, reviews, inventory_logs
- **orders** ← order_items
- **addresses** ← orders

## Notes

- All foreign keys are set with appropriate `ON DELETE` actions for data integrity.
- Indexes are created for commonly queried fields to improve performance.
- ENUMs are used for fields with limited valid values (e.g., `user_type`, `status`, `address_type`, `change_type`).

---
