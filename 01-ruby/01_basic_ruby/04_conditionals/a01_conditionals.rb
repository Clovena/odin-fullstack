# src: https://launchschool.com/books/ruby/read/flow_control#exercises

# 1. Write down whether the following expressions return true or false. Then type the expressions into irb to see the results.
(32 * 4) >= 129 #=> false
false != !true #=> false
true == 4 #=> false
false == (847 == '847') #=> true
(!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false #=> true

# 2. Write a method that takes a string as an argument.
# The method should return a new, all-caps version of the string, only if the string is longer than 10 characters.
# Example: change "hello world" to "HELLO WORLD".

def long_caps(string)
  length = string.length

  if length > 10
    string.upcase
  else 
    string
  end

end

puts long_caps("Hello")
puts long_caps("Hello World!!")

# 3. Write a program that takes a number from the user between 0 and 100
# and reports back whether the number is between 0 and 50, 51 and 100, or above 100.

def num_range() 
  puts "Input a number: "
  num = gets.chomp.to_i
  case
  when num < 0 
    puts "This number is below zero."
  when num <= 50
    puts "This number is in the range [0, 50]."
  when num <= 100
    puts "This number is in the range (50, 100]."
  else 
    puts "This number is above 100."
  end
end
num_range()

# 4. What will each block of code below print to the screen?

# Snippet 1
'4' == 4 ? puts("TRUE") : puts("FALSE")
# "FALSE"
# => nil

# Snippet 2
x = 2
if ((x * 3) / 2) == (4 + 4 - x - 3)
  puts "Did you get it right?"
else
  puts "Did you?"
end
# "Did you get it right?"
# => nil

# Snippet 3
y = 9
x = 10
if (x + 1) <= (y)
  puts "Alright."
elsif (x + 1) >= (y)
  puts "Alright now!"
elsif (y + 1) == x
  puts "ALRIGHT NOW!"
else
  puts "Alrighty!"
end
# "Alright now!"
# => nil

# 6. Write down whether the following expressions return true or false or raise an error. 

(32 * 4) >= "129" #=> error
847 == '847' #=> false; not the same type
'847' < '846' #=> false; based on string sorting (as are the below)
'847' > '846' #=> true
'847' > '8478' #=> false
'847' < '8478' #=> true
