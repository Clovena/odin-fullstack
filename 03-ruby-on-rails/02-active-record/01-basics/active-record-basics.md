# Active Record

Active Record is the interface that Rails offers between a database and an application. It allows data models to be structured in a logical and nearly plain-English way. 

## Object-Relational-Mapping

Active Record takes data stored in a database table using rows and columns and allows for interaction with that data as though it was a Ruby object. 

Instead of using SQLese to query something like `select * from users`, Active Record allows for syntax like `User.all`. This outputs an array filled with User objects that can be interacted with and manipulated at will.

As long as the app is configured properly in `config/database.yml`, any type of database can be used. Active Record smooths out all the differences between those databases automatically. 

## Rails Models

Consider the example where we want to store information about our users.
- We create a database table called `users`
- To access that data from the app, we create a model called `User`
  - This is really just a `.rb` file which inherits from Active Record, allowing it to use all the methods like `#all` and `#find` and `#create`

