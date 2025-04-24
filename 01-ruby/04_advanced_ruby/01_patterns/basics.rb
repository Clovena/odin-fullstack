# Pattern Matching Basics

# Pattern matching begins with a case statement.
# The difference is that rather than case-when,
# pattern matching uses case-in.

grade = 'C'

# Case-when syntax
case grade
when 'A' then puts 'Amazing effort'
when 'B' then puts 'Good work'
when 'C' then puts 'Acceptable'
when 'D' then puts 'Room to improve'
else puts 'See me'
end
# => Acceptable

# versus Case-in pattern matching
case grade
in 'A' then puts 'Amazing effort'
in 'B' then puts 'Good work'
in 'C' then puts 'Acceptable'
in 'D' then puts 'Room to improve'
else puts 'See me'
end
# => Acceptable

# Hash rocket syntax(?)
login = { username: 'zjricker', password: 'clovena' }
login => { username: username }
puts "Logged in with username #{username}"
# => Logged in with username zjricker

# case-in is best used when there are multiple conditionals 
# that could possibly be matched against.
# Hash rocket is best used when the data structure 
# being matched against is known (e.g. login above).

# Types of Patterns
# Object Pattern: any Ruby object matched using ===
# Variable Pattern
# As Pattern
# Alternative Pattern
# Guard Condition
# Array Pattern
# Hash Pattern

# Experimental additions:
# Rightward assignment
# Find Pattern

# Return Values
# There are two possible outcomes for a pattern match statement -
# either there is a match or there is not. 
# If a match exists: the last evaluated value in the body will be returned.
# If no match exists: NoMatchingPatternError will be returned.

grade = 'C'
result = case grade
in 'A' then 1
in 'B' then 2
in 'C' then 3
in 'D' then 4
else 0
end
puts result # => 3


###
# Object Pattern Match
### 

input = 3
case input
in String then puts 'input was of type String'
in Integer then puts 'input was of type Integer'
end
# This simulates the following: 
# String === input
# Integer === input

# Importantly, the pattern to match is placed on the left of the comparison.
# 3 === Integer is false, since 3 is the pattern to match. 
# Integer === 3 is true, since Integer is the pattern to match.

# Pattern Matching can be done on the following Objects: 
# Boolean
# nil
# Number
# String
# Symbol
# Array
# Hash
# Range
# regular expressions
# Procs


###
# Variable Pattern Match
###

age = 28
case age
in a
  puts a
end
# => 28

# Variable Patterns bind a variable(s) to the values that match the pattern.
# The Variable Pattern always binds the value to the variable.
# Be careful if there is another variable with the same name in the outer scope.
# It will be overwritten from the Variable Pattern Match.

a = 5
case 1
in a
  a
end
puts a # => 1 (wha?)
# Though this may look like a comparison between 1 and the global var a,
# It is actually an assignment from the Variable Pattern Match.
# To prevent this, the pin operator ^ is used.
# This allows matching against a variable of the name pinned.

a = 5
case 1
in ^a
  :no_match
end
# => NoMatchingPatternError


###
# As Pattern Match
###

# Similar to the variable pattern:
case 3
in 3 => a 
  puts a 
end
# => 3
# Here, the value of 3 is being assigned to the variable a.


###
# Alternative Pattern Match
###

case 0
in 0 | 1 | 2
  puts :match
end
# => match
# This allows multiple options to be checked for match at once. Nifty!


###
# Guard Conditions
###

# Not technically a Pattern, but a way to make sure the pattern is matched
# if and only if the guard condition holds true.
some_other_value = true
case 0
in 0 if some_other_value
  puts :match
end
# => match

# unless can be used instead of if, depending on context.
