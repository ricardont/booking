# Booking flights app

## Technologies
 - Ruby  
 - Rails 
 - ActiveRecord 
 - Testing:
 	- Rspec 
 	- WebMock 
 - Views:
 	- erb 
 - Sass  
 - Postgres 
 - Third party APIs :
 	- API 1
 - Deployment:
 	- Heroku
## Scenario

Flight search web application where you need to connect to a third party JSON service to retrieve airport codes & names and their availability.

Your application will work as a middle tier and cache some information in the sense that will persist data that is not very likely to change in a short/med period (like airport codes). This information can be saved in database or using a Non Relational Database (NRDMS).

- Scope of this is:
   - Retrieve airport codes and names
   - To be able to search for flight availability using external json api 
   - Build backend JSON rest services
   - Build Frontend controllers and map model

- Out of scope:
  - Bookings

## Issues 
Backlog should be registered and updated in Github issues tab.

## Deployment
Should be deployed to heroku since the first commit 

## Code Correctness
Use rubocop ensure code is correctly wirtten. Rubocop rules should be provided.

## Code Reviews
You should create a new branch for each task (issue) and create a PR and assign `@dvarelap` as reviewer.

## Docs
Create `docs.md` where you put how to install, deploy and use your app.

## Tests 
I should be able to follow continous testing using CI/CD tools like SemaphoreCI, CircleCI, etc.

## Expected Results
I should be able to search for a location and the start / end dates of my trip.
The application should display real flight availability, you choose how (grouped vs non grouped, high vs low price etc).

