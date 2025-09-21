#!/bin/bash

BASE_DIR="/mnt/c/Users/meezz/OneDrive/Desktop/AllFiles/8th semester/Php-Laravel/Mini-Projects"

# All Laravel project folders (skip library-system and oop-crud-demo)
PROJECTS=(
  multi-page-site
  blog-app
  auth-system
  profile-upload
  auth-middleware
  flash-messages
  blog-api
  email-confirmation
  task-manager-api
  task-crud
  sanctum-auth
  api-tests
  role-cms
  admin-panel
  user-panel
  cms-queue-email
  cms-deploy
)

for project in "${PROJECTS[@]}"; do
  echo "🔧 Setting up $project ..."
  cd "$BASE_DIR/$project" || { echo "❌ $project not found, skipping..."; continue; }

  # Install PHP dependencies
  composer install

  # Install JS dependencies
  npm install

  # Generate Laravel app key
  php artisan key:generate

  # Migrate database (if configured)
  php artisan migrate || echo "⚠️  Migration failed (maybe DB not configured yet)"
done

echo "✅ All projects processed!"
