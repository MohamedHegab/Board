# Board-REST

* Generate an API application with Rails 5
* Setup RSpec testing framework with `Factory Bot`, `Database Cleaner`, `Shoulda Matchers`, `pundit-matchersand` `Faker`.
* Build models and controllers with TDD (Test Driven Development).
* Apply with `JWT`, `pagination`, `API versioning`and `Serializers`

## This simple application contents four resources
  - User
    - Lists
      - Cards
        - Comments
          - Replies
          
### Authentication system by adding the following service classes
- JsonWebToken - Encode and decode jwt tokens
- AuthorizeApiRequest - Authorize each API request
- AuthenticateUser - Authenticate users
- AuthenticationController -  authentication process

### User
Implement Single Table Inheritance (STI) For Member and Admin, Authorized users use [pundit](https://github.com/varvet/pundit)

```
Admin.new
=> #<Admin:0x007fec6b626088 id: nil, username: nil, email: nil, password_digest: nil, type: "Admin", created_at: nil, updated_at: nil>

Member.new
=> #<Member:0x007fec6b670368 id: nil, username: nil, email: nil, password_digest: nil, type: "Member", created_at: nil, updated_at: nil>
```
### Comment
Create one Comment model with a polymorphic association. There will then be one column for “commentable_id”, which will store the ID of the object and then “commentable_type”, which will indicate what type of object (in this case, a Card or a Comment).

## Prepare DB
application.yml have rails environment variables 
```
mv config/application.yml config/application_example.yml
```
### Create DBs
  Run seed file to create member and admin user.
```
 rails db:create db:migrate db:seed
```

### Test
```
bundle exec rspec
```
~~Failed~~ All green!
