# Variables

age = 27
# This is pretty much it.

combined_age = 27 + 25 + 63 + 62
# Can also be assigned the result of an expression.

age = 42
# Can be reused and hence overwritten.

combined_age += 3 
# This method is available in Ruby also.
# Same as (27 + 25 + 63 + 62) + 3

# Similarly:
age -= 2
age *= 7
age /= 10
# How exciting.


# Variables as References

desired_location = "Greece"
zacs_location = desired_location
# This second var, zacs_location, is pointing to
# the same piece of memory that desired_location does, which stores "Greece".

# If that original string "Greece" is modified in memory, variables which reference it can behave unexpectedly.
zacs_location.upcase! #=> "GREECE"

# The ! operator on a method applies the method to the string in memory, not just the variable it's called upon. 
zacs_location #=> "GREECE"
desired_location #=> "GREECE" as well!


# Inputs

# For information provided by a user, use the #gets method.
name = gets
# Input "Zac"
name #=> "Zac\n"

# Like in the strings methods file, we saw the use of escape characters and the #chomp method.
# That can be applied here. 

name_chomped = gets.chomp
# Input "Zac"
name #=> "Zac"
# Much better!


# Variable Scope

name = 'Somebody Else'
def print_full_name(first_name, last_name)
  name = first_name + ' ' + last_name
  puts name
end
# Here we have a variable, `name`, and a method with the variable `name` within. 

# However, 
print_full_name 'Zac', 'Ricker' #=> "Zac Ricker"
print_full_name 'Olivier', 'Messiaen' #=> "Olivier Messiaen"
print_full_name 'Jameson', 'Williams' #=> "Jameson Williams"
puts name #=> "Somebody Else"

# The use of `name` within the method does not alter the global `name`

# Conversely, in blocks:
total = 0
[1, 2, 3].each do |number|
  total += number
end
puts total #=> 6; the global total is modified by the block

# If a block has something like this inside: 
a = 5
3.times do |n|
  a = 10
  b = 4
end
# This results in an error, because b is not defined outside the scope of the block. 


# Types of Variables
# Constants, global variables, class variables, instance variables, and local variables. 

# Constants are typically formatted in UPPER_SNAKE_CASE 
MY_CONSTANT = "This is available throughout an app's scopes."

# Global variables must be preceded by $
# Rubyists tend to stay away from global variables as there can be unexpected complications when using them.

$var = "This is also available across an app."

# Class variables must be preceded by @@
# These are accessible by instances of the class, as well as the class itself. 
# When you need to declare a variable that is related to a class,
# but each instance of that class does not need its own value for this variable, you use a class variable.

@@instances = 0

# Instance variables use one @
# These are accessible throughout the current instance of the parent class.

@var = "Instance variable"

# Finally, local variables are just the standard familiar variable declarion. 

var = "Woohoo!"


