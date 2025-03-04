# src: https://launchschool.com/books/ruby/read/basics#exercises

# 1. Add two strings together that, when concatenated, return your first and last name as your full name in one string.
first_name = "Zachary"
last_name = "Ricker"

full_name_plus = first_name + " " + last_name
puts full_name_plus
# This method does not modify the original variables first_name and last_name.
# They can both be used again in their original form. 

full_name_shovel = first_name << " " << last_name
puts full_name_shovel
# This modified first_name itself, as can be seen with the below puts.
# puts first_name
# last_name remains unmodified.
# puts last_name

# Therefore, running these two lines subsequently puts the wrong result. 
# In addition, this method also modifies first_name_itself
# If this were used alone, this would also be a valid solution. 

# full_name_concat = first_name.concat(" ").concat(last_name)
# puts full_name_concat


# 2. Use modulo and/or division to take a 4 digit number and find the digit in the:
# a) thousands place, b) hundreds place, c) tens place, and d) ones place.

num = 4537

thousands = num.to_i / 1000
hundreds = (num.to_i % 1000) / 100
tens = (num.to_i % 100) / 10
ones = num.to_i % 10

puts thousands
puts hundreds
puts tens
puts ones


# 3. Write a program that uses a hash to store a list of movie titles with the year they came out.
# Then use the puts command to make your program print out the year of each movie to the screen.

movies = {
  :anger_mgmt => 2003,
  :awakenings => 1990,
  :bronx_tale => 1993,
  :elm_street => 1984,
  :league_own => 1992,
}

puts movies[:anger_mgmt]
puts movies[:awakenings]
puts movies[:bronx_tale]
puts movies[:elm_street]
puts movies[:league_own]

# 4. Use the dates from the previous example and store them in an array.
# Then make your program output the same thing as exercise 3.

movie_arr = [
  movies[:anger_mgmt],
  movies[:awakenings],
  movies[:bronx_tale],
  movies[:elm_street],
  movies[:league_own],
]

puts movie_arr[0]
puts movie_arr[1]
puts movie_arr[2]
puts movie_arr[3]
puts movie_arr[4]

# 5. Write a program that outputs the factorial of the numbers 5, 6, 7, and 8.

five_factorial = 5 * 4 * 3 * 2 * 1
six_factorial = 6 * five_factorial
seven_factorial = 7 * six_factorial
eight_factorial = 8 * seven_factorial

puts five_factorial
puts six_factorial
puts seven_factorial
puts eight_factorial

float_a = 3.2
float_b = 4.8
float_c = 9.13

puts float_a ** 2
puts float_b ** 2
puts float_c ** 2
