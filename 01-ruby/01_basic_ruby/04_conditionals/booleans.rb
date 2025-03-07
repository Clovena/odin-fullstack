# Conditionals

# Let's start with true/false

full_name = "Zachary Ricker"

if full_name == "Zachary Ricker" # this evaluates to true
  "Hello Zac!"
end

# The only things that evaluate to false are
# false
# nil

# Even things like 0 do not evaluate to false in Ruby. 

if 0
  "Hello"
end
# This will actually output "Hello" and return nil!

# If statements can be condensed to one line if only one line of code is inside the block.
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
