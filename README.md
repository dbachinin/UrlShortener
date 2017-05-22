# README

This simple app, shorted you long URL, and share it among other users.

This app created on Casein CMS https://github.com/russellquinn/casein.

Before you start this app:

Replace IP BASE_URL in config/application.yml and app/models/link.rb with you domain name or IP.

create database connection in config/database.yml

and rewrite you database connection requisites.

Aftervards.

bundle install

and you require create admin

rake db:setup
rake 
rake casein:users:create_admin email=you@mail.com password=123456789

And that's all! You can login!
