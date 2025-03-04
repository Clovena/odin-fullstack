# src: https://launchschool.com/books/ruby/read/variables#exercises

# 1. Write a program that asks the user to type in their name
# and then prints out a greeting message with their name included.

name = gets.chomp
# Don't forget the chomp method!
puts "Greetings, #{name.capitalize}!"


# 2. Write a program that asks a user how old they are
# and then tells them how old they will be in 10, 20, 30 and 40 years. 

age = gets.chomp
add_to_age = [10, 20, 30, 40]
add_to_age.each do |a|
  puts "In #{a} years you will be:"
  puts age.to_i + a
end

# 3. Add another section onto #1 that prints the name of the user 10 times.
# You must do this without explicitly writing the puts method 10 times in a row. 

10.times { puts name }

# 4. Modify #1 again so that it first asks the user for their first name,
# saves it into a variable, and then does the same for the last name. Then output their full name all at once.

first_name = gets.chomp
last_name = gets.chomp
puts "Greetings, #{first_name.capitalize} #{last_name.capitalize}!"
