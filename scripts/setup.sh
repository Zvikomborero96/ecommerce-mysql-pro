#!/bin/bash
set -e

# Config
DB_NAME="ecommerce_db"
DB_USER="root"

# Prompt for password
echo "Enter MySQL password for user '$DB_USER' (input will be hidden):"
read -s DB_PASS

# Create database
echo "Creating database '$DB_NAME'..."
mysql -u "$DB_USER" -p"$DB_PASS" -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

# Load schema if present
if [ -f sql/schema.sql ]; then
  echo "Running schema.sql..."
  mysql -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < sql/schema.sql
else
  echo "❌ Error: sql/schema.sql not found. Aborting setup."
  exit 1
fi

# Load seed data if present
if [ -f sql/seed_data.sql ]; then
  echo "Running seed_data.sql..."
  mysql -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < sql/seed_data.sql
else
  echo "❌ Error: sql/seed_data.sql not found. Aborting setup."
  exit 1
fi

echo "✅ Setup complete: Database '$DB_NAME' is ready to rock."
