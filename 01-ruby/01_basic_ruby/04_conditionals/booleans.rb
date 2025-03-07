# Conditionals

# Let's start with true/false

full_name = "Zachary Ricker"

if full_name == "Zachary Ricker" # this evaluates to true
  "Hello Zac!"
end

# In addition to true and false, Ruby has a third boolean value called nil. 
# nil is returned when a piece of code has nothing else to return. 
# In statements where a boolean is required, nil behaves like false. 
# The only things that evaluate to false are
# false
# nil

# Even things like 0 do not evaluate to false in Ruby. 

if 0
  "Hello"
end
# This will actually output "Hello" and return nil!

# If statements can be condensed to one line if only one line of code is inside the block.

if full_name == "Zachary Ricker" then "Hello Zac!" end
# `then` is required in this type of code. 

# The code to be evaluated can also be placed first, before the boolean operator.
puts "Hello" if 1 < 2
# No end needed!

# Naturally, there exists an else clause in Ruby.

if full_name == "Zachary Ricker"
  "Hello Zac!"
else 
  "Hello stranger!"
end

# else if syntax is a bit different:

if full_name == "Zachary Ricker"
  "Hello Zac!"
elsif full_name == ""
  "Hello stranger!"
else 
  "What is your name?"
end 

# Boolean operators
5 == 5
5 != 6
5 > 4
5 < 198274738290
5 >= 5
5 <= 6

# Boolean methods
# #eql? checks both the value type and the actual value it holds.
5.eql?(5.0) #=> false; although they are the same value, one is an integer and the other is a float
5.eql?(5) #=> true

# #equal? on the other hand checks whether both sides are the exact same object in memory.
# Integers are stored as one object in memory, therefore:
a = 5
b = 5
a.equal?(b) #+=> true

# Strings are not stored as one object in memory:
c = "Hello"
d = "Hello"
c.equal?(d) #=> false!

# Ruby also boasts a so-called spaceship operator: <=>
# This does not return true/false but rather -1 / 0 / 1
5 <=> 10 #=> -1
10 <=> 10 #=> 0
10 <=> 5 #=> 1

# -1 could be interpreted as "less than;" 0 as "equal to;" and 1 as "greater than."
# The spaceship is most commonly used in sorting operations. More to come there. 

# Boolean operators can be strung together, naturally. 
# && is the AND operator. Needs both sides to be true.
# Can also use `and`

if full_name == "Zachary Ricker" && 5 < 3
  "Uh oh"
elsif full_name == "Zachary Ricker" and 5 < 10
  "Hello Zac!"
else 
  "Hello stranger!"
end

# || is the OR operator. Can also use `or`
if full_name == "Zachary Ricker" || full_name == "Zac Ricker"
  "Hello Zac!"
else 
  "Hello stranger!"
end 

# In Ruby, there is an operator ||= called the conditional assignment. 
a ||= b
# If a is undefined or falsey, then evaluate b and set a to the result. 
# This is approximate shorthand for 
a || a = b
# and is NOT equivalent to
a = a || b
# due to the hierarchy of operators in Ruby. i.e. = gets evaluated first, then || 

# ! is the NOT operator. 
if full_name != "Zachary Ricker" 
  "Hello stranger!"
elsif !(full_name == "Undefined")
  "Hello acquantance!"
else 
  "Hello Zac!"
end 
