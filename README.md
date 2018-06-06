### README

# Fiver

### See The Active Site:
[Fiver](https://five-r.herokuapp.com) <br>

Pitch:
This app searches Twitter based on search parameters that the user provides it.  The user then has the opportunity to fetch both a tone analysis of the tweets, and then also put in a call to a Cryptocurrency API that will fetch the current market status of that currency.

Tech Pitch:
I built this project to push my boundaries in a number of areas. It was the first project where I managed the entire project scope and the architecture.  It was also used to push my usage of consuming both internal and external API's further.  It also was a small exercise in manually building serializers in POROs and passing that to the internal API point with only the desired information.  I also took the opportunity to build out some API requests using the JavaScript fetch API.

For the future I'd like to refactor this into solely backend API endpoints and have a seperate APP that consumes those endpoints. I would also like to build rake tasks to run at certain times and then push the data to a service like Redis in order to speed up the API calls.

### Table Of Contents
- [Versions/Prerequisites](#versions-prerequisites)
- [Setup](#setup)
- [Database](#database)
- [The Test Suite](#the-test-suite)
- [Spinning Up A Server](#spinning-up-a-server)
- [Authors](#authors)

### Versions/Prerequisites
---
##### Main:
To Install and run this application please be aware of the following versions and requirements:
- Postgresql 10+
- Rails 5+
- Ruby 2.4+
- Node.js
- JQuery

###### Secondary:
- ActiveRecord
- ActiveModelSerializers
- PG
- Puma

### Setup
---
- First clone down this repository and change directory into the project directory:
```
git clone https://github.com/nergdnvlt/fiver.git
cd fiver
```
- Then in your command line run bundle to install the gem dependencies:
```
bundle
```
- Now setup your database and run the migrations to properly set up your database tables:
```
rake db:create
rake db:migrate
```
- It's now time to seed the database with the required data:
```
rake db:seed
```
- At this point the project is set up. Explore at will.

<br>

### The Test Suite
---

#### Test Information

##### Test Suite Components:
- DatabaseCleaner
- FactoryBot
- Rspec
- ShouldaMatchers

#### Test Documentation and Tweaks

- For additional documentation and the individual tests as the suite runs:
```
--format=documentation
```
- Additional Useful Flags:
```
--order=random
--color
```

##### About The Tests:
 The test suite includes test for the following:
- Model Level Testing<br>
- Feature Testing
- Service Testing
- Presenter Testing
These tests can be found in the following folder:
```
spec/models/
spec/features/
spec/services/
spec/presenters
```

##### Running The Suite:
- In order to run the test suite, from the root project folder simply run:
```
rspec
```

<br>

### Spinning Up a Server
___

- Next spin up your server:
```
rails s
```
<br>


### Authors
- [Tyler Lundgren](https://github.com/nergdnvlt)
