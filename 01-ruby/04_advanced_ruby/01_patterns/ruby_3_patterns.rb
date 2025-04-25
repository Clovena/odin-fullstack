# Pattern Matching in Ruby 3

# Ruby 3 introduced some new patterns: 
# Rightward assignment
# Find Pattern

###
# Rightward assignment
###

# Typically, variables are placed on the left,
# and an expression is used to bind a value to the variable.
num = 3.14

# With rightward assignment, an object is deconstructed
# and values are assigned on the right of the expression.
# The hash rocket is used for this case.

login = { username: 'zjricker', password: 'clovena' }
login => { username: user }
puts "Logged in with username #{user}"
# => Logged in with username zjricker

# The rocket syntax here is best used when the data structure
# being matched against is known, like login above.


### 
# Find Pattern Match
###

# Like matching with *part* of a hash,
# part of an array can be matched upon.
# Place a splat * on either side of the part to match.

case [1, 2, 3]
in [*, 1, 2, 3, *]
  puts :match
end
# => match

# Variable assignment can also be used to capture non-matched parts.
case [1, 2, 3]
in [*head, 2, 3, *tail]
  p head
  p tail
end
# => [1]
# => [ ]

# Let's say you have an Array of mixed Strings and Integers
# and want to match on the first instance of two consecutive Strings.
# With Find Pattern Matching:

mix = [1, 2, 'a', 4, 'b', 'c', 7, 8, 9]
case mix
in [*head, String => x, String => y, *tail]
  p head
  p x
  p y
  p tail
end
# This matches on the consecutive ['b', 'c'] and outputs:
# => [1, 2, 'a', 4]
# => "b"
# => "c"
# => [7, 8, 9]

# One more example: 
# Consider an Array of Hashes or JSON data.
# A record must be located from that data.
# Matching, then, must be done on a few hash keys.
# The data is:
data = [
  {name: 'James', age: 50, first_language: 'english', job_title: 'general manager'},
  {name: 'Jill', age: 32, first_language: 'italian', job_title: 'leet coder'},
  {name: 'Helen', age: 24, first_language: 'dutch', job_title: 'biscuit quality control'},
  {name: 'Bob', age: 64, first_language: 'english', job_title: 'table tennis king'},
  {name: 'Betty', age: 55, first_language: 'spanish', job_title: 'pie maker'},
]

# Without Find Matching, a person may be found like this:
name = 'Jill'
age = 32
job_title = 'leet coder'

match = data.find do |person|
  person[:name] == name &&
    person[:age] == age && 
    person[:job_title] == job_title
end

match&.fetch(:first_language)
# Not great, Bob. 

# With Find Matching: 
case data 
in [*, { name: ^name, # Pin to match on variable value
         age: ^age, # Pin to match on variable value
         first_language: first_language, # VAR ASSIGNMENT to return first_language
         job_title: ^job_title },
    *] # Pin to match on variable value
else 
  first_language = nil
end
puts first_language
# => italian