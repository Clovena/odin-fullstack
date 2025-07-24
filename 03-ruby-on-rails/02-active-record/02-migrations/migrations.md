# Migrations

In the context of Rails, a migration does not refer to the movement of data from one location to another. Instead, it is a *schema* migration, which is the modification of the database's schema without moving it to a new location. 

A Rails migration is a script that sets up or modifies a schema in a reversible and re-appliable way. These modifications can entail creating and dropping tables, adding and removing columns, and others. Multiple migration files can be run in sequence like a script. Migrations use SQL commands under the hood. 

One of the first steps in developing a Rails project, after `rails new ProjectName` and `cd ProjectName`, is to determine and set up the data models required for - at least the first iteration of - the site.

Creating the database is done, as we saw, by running `$ rails db:create`. This requires two steps:
- Creating a model in `app/models` 
- Creating a database table with the appropriate columns.
  - This is done by creating and running a migration file. 

## Creating Migration Files

One of two ways to create a migration is with the model generator `$ rails generate model ModelName`.  
The other way is with the migration generator `$ rails generate migration MigrationName`. 

### Model Generator

`$ rails generate model ModelName` creates both a model file and a migration file. This command outputs the files being created.
- The model file created is simply a bare-bones file in the `app/models` directory.
- The migration file created goes to `db/migrate` and started with a timestamp, e.g. `20250724121212_create_users.rb`. 

The migration file is another bare-bones Ruby class that inherits from `ActiveRecord::Migration`. 

### Migration Generator

To only create the database migration file, without the model file, use `$ rails generate migration MigrationName`. This is useful once a data table is being modified, rather than created.

## Writing and Running Migration Files

Writing migration files simply entails adding proper Ruby methods, like `#create_table`, and providing its necessary parameters. 

Running migration files is done with `$ rails db:migrate`. This runs any migrations that haven't yet been run. 

## Rollback

One of the most useful features of Active Record is found via `$ rails db:rollback`. This reverses the most recent series of migrations. 

This implies reversibility in Active Record. For each method used in the migration, it should be specified how to reverse it if need be. 
- The reverse of adding a table is dropping a table,
- the reverse of adding a column is removing a column, ...

Less obvious instances require the use of `#change` or even `#up` and `#down` methods. 
