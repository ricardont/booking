# Developer Diary

## Install ruby 
```sh
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash
\curl -sSL https://get.rvm.io | bash -s stable --ruby
```
## install Rails
install git
```sh

install node js
```sh
 sudo apt-get install node.js
```sh
  gem install rails
```
## error in working proyect can't find gem bundler (>= 0.a) with executable bundle (Gem::GemNotFoundException) during bundle install with gem
```sh
 $ gem install bundler -v "$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)"
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
  CREATE ROLE  < * you should  receive this message, no need to type it *
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
 at this point I had received the page :
 ```
The page you were looking for doesn't exist.
You may have mistyped the address or the page may have moved.
 ```
 and I thank it was not propoerly depployed, but there was no errors, so I just create a welcome controller, I created a new branch first to leave my master intacted in case of failure, and push to heroku master from a non master branche using the following command:
 ```sh
 git push heroku setup_heroku:master
 ```
 and resulted greate I saw the welcome page at heroku

## Loads airports data base
To convert lower case is ctrl + k, release k without holding ctrl and then press once l for lowercase or u to uppercase
see columns model in rails console
Airport.column_names
 migration to remove columns:

 rails g migration RemoveFromModel
 class RemoveFromAirport < ActiveRecord::Migration[5.2]
 def change
  remove_column :airports, :type
  remove_column :airports, :source
 end
end

remove all
Model.delete_all

rails db:seed RAILS_ENV=test
rails db:seed RAILS_ENV=development
###Seeds
 I get the csv file from  [Open Flights airports db]( https://raw.githubusercontent.com/jpatokal/openflights/master/data/airports.dat "https://openflights.org") 

 ```
**Airport ID**  Unique OpenFlights identifier for this airport.
**Name**  Name of airport. May or may not contain the City name.
**City**  Main city served by airport. May be spelled differently from Name.
**Country** Country or territory where airport is located. See countries.dat to cross-reference to ISO 3166-1 codes.
**IATA**  3-letter IATA code. Null if not assigned/unknown.
**ICAO**  4-letter ICAO code.
**Null** if not assigned.
**Latitude**  Decimal degrees, usually to six significant digits. Negative is South, positive is North.
**Longitude** Decimal degrees, usually to six significant digits. Negative is West, positive is East.
**Altitude**  In feet.
**Timezone**  Hours offset from UTC. Fractional hours are expressed as decimals, eg. India is 5.5.
**DST** Daylight savings time. One of E (Europe), A (US/Canada), S (South America), O (Australia), Z (New Zealand), N (None) or U (Unknown). See also: Help: Time
**Tz** database time zone Timezone in "tz" (Olson) format, eg. "America/Los_Angeles".
**Type**  Type of the airport. Value "airport" for air terminals, "station" for train stations, "port" for ferry terminals and "unknown" if not known. In airports.csv, only type=airport is included.
**Source**  Source of this data. "OurAirports" for data sourced from OurAirports, "Legacy" for old data not matched to OurAirports (mostly DAFIF), "User" for unverified user contributions. In airports.csv, only source=OurAirports is included.
 ```
 in rspec helper 
added database cleaner to remove testing database records and load seeds in rspec_helper

```sh
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    Rails.application.load_seed # loading seeds
  end
```



 ## create searching function
 At first a method search was going to be deinfed in teh controllor, after research i determining screating activerecord scope 

 ##setup heroku database
 Host
ec2-184-73-216-48.compute-1.amazonaws.com
Database
da84d0cre65i93
User
xgkmcyzyjfylqn
Port
5432
Password
79a886c47e908eedd328cc8bd5dcd32ffb978bcebb947919faf9e80895181c74


 figaro heroku:set -e production

 set figaro vars in heroku
figaro heroku:set
 This is to run migrations on heroku and run seeds
```sh
 heroku run rake db:migrate
 heroku run rake db:seed
```

push to heroku from non master branch
```sh
git push heroku local_branch:master
```

## Installing webmock to test rest api

## To use haml views the haml-rails gem is necessary
## I had to convert all erb files to haml  with 
```sh
rake haml:erb2haml
```
## Issue, the applicato n layout was not loading 
  The Issue was I had accidentally created the main screen controller inhereted from ActionController::Base instead of ApplicationConroller

## RVM basic usage
```sh
   rvm install ruby2.4.0
   rvm list
   rvm --default 2.4.0
```

## VAGrant VAGrant VAGrant VAGrant
install vagrant
instal vrtual box
look for machine (ubuntu rais)
download machine
vagrant init
vagrant up
vagrant ssh
###shut down vagrant machine
vagrant halt
###vagrant shared directory
/vagrant where vagrantfile is located
#cant connect to localhost on rails app
add the following line to vagrantfile
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  reboot the vagrant machine with vagrant halt and vagrant up and run rails app with
 ```sh 
  rails s -b 0.0.0.0
 ```
 ##setting up postgresql in vagrant machine 
 sudo -u postgreS psql 
THIS DID NOT WORKED THIS TIME >>
```sh    
  create role booking_dev with createdb login password '1234';
  CREATE ROLE  < * you should  receive this message, no need to type it *
  create role booking_test with createdb login password '1234';
  CREATE ROLE  < * you should receive this message, no need to type it *
 ```
 THIS WORKED:
 ```sh    
  create database booking_dev;
  create user booking_dev with encrypted password '1234';
  grant all  privileges on database booking_dev to booking_dev;
```
##append rails from ajax result in container
layout false in the controller , to get rid of of the layout from that response since that must be isolated
##Bundler update
I tried to update bundler to 2.0 
```sh
bundle update --bundler
```
and failed to deployed on heroku since this one supports until 2.0.1
the following command will update to the most rescent v "2.0.2" "by the time this is being written"
```sh
gem uninstall bundler -v "1.17.1"
gem install bundler -v "2.0.1"
bundle install
```
commit the Gemfile.lock file and push it to heroku
```sh
git add Gemfile.lock
git commit -m add "bundler update"
git push heroku
```
##haml
construct element id in haml with ruby value variable
.item{:id => "item#{item.id}"}= item.body
