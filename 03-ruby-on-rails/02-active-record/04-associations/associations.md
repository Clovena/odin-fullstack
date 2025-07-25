# Assocations

Active Record has its own version of the SQL `join` function. A piece of code that gets all posts from the first user, i.e. `User.first.posts`, is all that's required to do so. But it must be accomplished with associations.

Assocations in Rails are simply relationships between tables. They help streamlining certain operations like adding or removing data as well. e.g. once an assocation has been declared between `Users` and `Posts` tables, something like `@post = @user.posts.create(title: "New Post Title", content: "Content of the new post.")` or `User.find(user_id).posts` can be used to achieve desired results.

On the database level, every row in one table will have an associated `_id` column to map it to associated tables. e.g. `posts` will include `user_id` to map it to the associated `Users`.

## Building Associations

Rails uses `has_many` and `belongs_to` to declare one-to-many associations. e.g. an instance of `User`, for example, `has_many :posts`. Similarly, an instance of `Post` `belongs_to :user`. These lines are declared in each model. 

One-to-one relationships also exist, of course, and that uses `has_one` and `belongs_to`. 

Many-to-many relationships are declared with `has_and_belongs_to_many`. e.g. a `Human` can have many favorite `Dog` objects, and each `Dog` can have many favorite `Human` objects. In Rails, these relationships require another table, called a "through" table, to keep track of all the many-to-many relationships. 

To declare these through-relationships, Rails uses `through: :object` syntax. See the below example.

```rb
class Physician < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
end

class Appointment < ApplicationRecord
  belongs_to :physician
  belongs_to :patient
end

class Patient < ApplicationRecord
  has_many :appointments
  has_many :physicians, through: :appointments
end
```

Here, the `Physician` class has its own id and name. the `Patient` class has its own id and name. The through-table, `appointments`, will have its own id, as well as `physician_id` and `patient_id`. 
