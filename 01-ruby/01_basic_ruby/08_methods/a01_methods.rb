# src: https://launchschool.com/books/ruby/read/methods#exercises

# 1. Write a program that prints a greeting message.

def greeting(name = "there") 
  "Hello #{name}!"
end

# 2. What do the following expressions evaluate to?
# That is, what value does each expression return?

x = 2 # => 2
puts x = 2 # => nil
p name = "Joe" # => "Joe"
four = "four" # => "four"
print something = "nothing" # => nil

# 3. Write a program that includes a method called multiply
# that takes two arguments and returns the product of the two numbers.

def multiply(n, m)
  n * m 
end

# 4. Edit the method below so that it prints words on the screen.

def scream(words)
  words = words + "!!!!"
  puts words
end
scream("Yippeee")
