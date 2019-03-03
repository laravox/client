#!/bin/bash
# Sets up environment for first run.
# Installs dependencies, creates .env (if needed), seeds,
# adds admin permissions, installs passport,
# and generates API docs.

composer install

if [ -e x.txt ] 
then
    cp .env.example .env
    php artisan key:generate
fi

php artisan migrate
php artisan db:seed
php artisan apiato:permissions:toRole admin
php artisan passport:install
yarn
php artisan apiato:docs

