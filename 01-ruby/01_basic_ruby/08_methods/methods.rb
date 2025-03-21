# Methods

# In documentation, methods are written with the octothorpe #
# For example: the #times loop and the #upto loop are both
# methods on the Integer class. 
# They can be more fully written as Integer#times and Integer#upto

# Another example seen previously is #reverse - or String#reverse
"anything".reverse # => "gnihtyna"

# Creating a method

def my_name
  "Zac Ricker"
end
puts my_name 
# "Zac Ricker"
# => nil

def greet(name)
  "Hello, #{name}!"
end
puts greet("Zac")

# Like in R, you can set default arguments for each parameter. 

def say_hi(name = "stranger")
  "Hi there, #{name}!"
end

puts greet("Zac") # => Hi there, Zac!
puts greet # => Hi there, stranger!

# Note that these methods do not have a return keyword. 
# Ruby offers *implicit return* for methods, meaning that
# Ruby will return the last expression that was evaluated
# even without the return keyword.

# Having said that, an explicit return can be used.
def my_name
  return "Joe Smith"
  "Jane Doe"
end
puts my_name # => "Joe Smith"


# This is common practice when a method may check for errors before continuing. 
def even_odd(number)
  
  unless number.is_a? Numeric
    return "A number was not entered."
  end

  if number % 2 == 0
    "That is an even number."
  else
    "That is an odd number."
  end
end

puts even_odd(20) #=>  That is an even number.
puts even_odd("Ruby") #=>  A number was not entered.

# Chaining methods

phrase = ["be", "to", "not", "or", "be", "to"]

puts phrase.reverse.join(" ").capitalize
# => "To be or not to be"

# Predicate methods

# Ruby hosts a collection of methods written with a ? on the end,
# which return either true or false. 

5.even?
18.odd?
12.between?(8, 20)

# Bang methods

# Ruby also uses the syntax ! to indicate methods
# which modify the object it's called upon. 

whisper = "HELLO WORLD"
whisper.downcase # => "hello everybody"; does not modify whisper
whisper.downcase! # => "hello everybody"; also modifies whisper
# This above is equivalent to whisper = whisper.downcase


# Call stack

# When calling methods within methods,
# methods are invoked in a last-in, first-out approach. 
def first
  puts "first method"
end

def second
  first
  puts "second method"
end
