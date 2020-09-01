# Ruby on Rails - Auth API
Authentication API project using Rails and Redis

## Ruby version
ruby 2.7.0

## Rails version
Rails 6.0.3

## System dependencies

* Any *nix plataform

## Setup
Run in your console:
```
bin/setup
```

## Run Tests
Run in you console:
```
rspec
```

## API Documentation:
`http://localhost:3000/api-docs`


Brief explanation about the application:
This project has 3 main points:
```
User registration
Use Login
User Logout
```

User Registration is simple post in `host.com/api/v1/users`
Login and logout will be handled by `SessionsController`, by the service `Session` and by the lib `AuthToken`
