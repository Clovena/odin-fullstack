# Outputs first

# Of course, we've seen the puts method already. 
puts "Learning Ruby is fun!"
puts 1234

# These both *return* nil, as in => nil
# They output what is prompted into the console, etc.
# but do not allow for saving values in a variable.

# There is also the print method, which works similarly. 
print "Learning Ruby is cool!"
print 5678

# Both, again, return => nil, but there is one key difference.
# puts also returns a \n, resulting in the following technical output:
puts "Hello world"
# Hello world
# => nil

# Whereas print does not include that \n, resulting in:
print "Hello world"
# Hello world=> nil

# This can also be demonstrated with a semicolon, which typically should not be used in Ruby. 
# However, in irb, to run multiple lines of code at once, a semicolon is needed. See below:

puts "Hello world"; puts "Ruby is fun"
# Hello world
# Ruby is fun
# => nil

print "Hello world"; print "Ruby is fun"
# Hello worldRuby is fun=> nil

# In practice, though, don't use the semicolon. 

# puts also treats arrays differently: 
print [1, 2]
# [1, 2]=> nil
puts [1, 2]
# 1
# 2
# => nil

# There are other versions of puts, too. 
# putc outputs just one character (hence the c)
putc "Hello world"
# H

# There is one last method to output things: p. 
# p will output the object passed to it. See below:
puts "Hello world"
# Hello world

p "Hello world"
# "Hello world"

# In this instance, the #p method displays the quotation marks, indicating a string object. 

# In short, print displays output without \n. Allows user to print multiple times on the same line.
# puts displays output with \n. 
# p displays object for debugging, etc. 


# Inputs

# We have also seen the #gets method before. 
gets 

# gets on its own will simply return the inputted value.
# gets also appends a \n at the end of the value, which can be removed with #chomp.

gets.chomp

# Variables can be used to store inputs. 
new_str = gets.chomp
puts new_str


