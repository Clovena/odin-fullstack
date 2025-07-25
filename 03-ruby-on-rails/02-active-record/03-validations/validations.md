# Validations

Validations are used to ensure that users are inputting the proper data. These are applied at three levels to ensure that data meets certain criteria before entering the database.
1. The client side
1. The server side
1. The database itself

Each level is more strict and secure with its validationt than the last.

At the most basic level, in `app/models/user.rb`:

```rb
class User < ApplicationRecord
  validates :name, presence: true
end
```

## Client Side Validation

At the topmost level, JavaScript code can be written to validate in the browser. This allows for a great UX, but it is easy to circumvent. 

As of HTML5, validations may also be performed in vanilla HTML forms. These are also easily circumvented. 

## Server Side Validation

Code can be written in Rails models to examine and validate inputs against constraints. This is more secure than client side validation, but it requires a full round-trip HTTP request. 

When an app gets scaled up to the point where multiple instances are running on multiple servers but talking to the same central database, so-called "race conditions" can occur. e.g. if two users simultaneously submit the same username, received by two separate instances of the application, both requests may return that the username is unique.

## Database Level Validation

Therefore, the database level is the only place to truly validate the truth. Things like `:username, unique: true` in a Rails model are instances of this.
