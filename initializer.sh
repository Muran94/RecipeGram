#!/bin/bash

# 1. Rails new
printf '\033[36m%s\033[m\n' 'docker-compose run web rails new . --force --no-deps --database=postgreql'
docker-compose run web rails new . --force --no-deps --database=postgresql
wait

# 2. Configure database
printf '\033[36m%s\033[m\n' 'Copying database.yml.'
cp -f database.yml config/database.yml && rm database.yml
wait

# 3. Create database
printf '\033[36m%s\033[m\n' 'Creating database.'
docker-compose run web rails db:create
wait

# 4. docker-compose build
printf '\033[36m%s\033[m\n' 'docker-compose build'
docker-compose build
wait

printf '\033[36m%s\033[m\n' 'Your app is now ready to start!'
printf '\033[36m%s\033[m\n' 'Run `docker-compose up` to start your app.'