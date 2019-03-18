# Developer Diary

## Install ruby 
## install Rails
```sh
  gem install rails
```
## Create new app without mini test, with rspec, webmock and postgresql
### Set up postgresql at the os (ubuntu)
* if you don't do this you will not be able to start postgresql service *
```sh
  sudo apt-get -y install postgresql postgresql-contrib libpq-dev
```
### Prepare db
*switch into the postgres user, create database for your app.*
```sh
  sudo su - postgres
  psql    
```
*Now you can create the role  for both dev and test environments*
```sh
  create role booking_dev with createdb login password '1234';
  CREATE ROLE  < * you should receive this message, no need to type it *
  create role booking_test with createdb login password '1234';
  CREATE ROLE  < * you should receive this message, no need to type it *

```
*use* *** \q *** *to exit*
### create rails app withoud mini-test and postgresql as db engine, 
```sh
rails new booking -T -d postgresql
``` 
**-T** *will exclude mini test, and* **-d postgresql** will install new gem including pg gem that is needed by rails to connect to the PostgreSQL database into that directory.

*edit your* **database.yml** *shoule look like this, or at least with this attributes*
```
development:
  database: booking_dev
  username: booking_dev
  password: 1234
  host: localhost
test:
  database: booking_test
  username: booking_test
  password: 1234
  host: localhost

```
*and finally*
```sh
  rake db:setup
Created database 'booking_dev'
Created database 'booking_test'
/home/ricky/rails/booking/db/schema.rb doesn't exist yet. Run `rails db:migrate` to create it, then try again. If you do not intend to use a database, you should instead alter /home/ricky/rails/booking/config/application.rb to limit the frameworks that will be loaded.
```
```sh
rails db:migrate
```
*this will create development and test databases and usrs, and create the schema_migrations which will record your migrations schemas and data*

### side note: uninstall postgres (just in case)
```sh
apt-get --purge remove postgresql\*
rm -r /etc/postgresql/
rm -r /etc/postgresql-common/
rm -r /var/lib/postgresql/
userdel -r postgres
groupdel postgres
```
******
### Start server
```sh
rails s
```
### Yay! You’re on Rails!
### Install rspec
*add to your gemfile*
```sh
group :development, :test do
  gem 'rspec-rails'
end
````
*then run*
```sh
rails generate rspec:install
Running via Spring preloader in process 13061
      create  .rspec
      create  spec
      create  spec/spec_helper.rb
      create  spec/rails_helper.rb
```
### Install webmock
*add webmock to gemfile in the development and test mocks*
```sh
 group :development, :test do
  gem 'rspec-rails'
  gem 'webmock'
end
```
*include at the rspec_helper file*
```
require 'webmock/rspec'
```

### Commit changes to  repsitory
```sh
git init
git commit -m "first commit"
git remote add origin https://github.com/ricardont/booking.git
git push -u origin master
```
##Setup heroku to deployment
instal heroku cli in local machine
```sh
sudo snap install --classic heroku
```
create repo in heroku
```sh
heroku git:remote -a booking-flights
git push heroku master 
$ heroku run  rake db:migrate
```