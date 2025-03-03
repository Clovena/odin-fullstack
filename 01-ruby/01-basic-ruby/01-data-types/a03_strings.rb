# Strings

# 1. Write the following strings using interpolation:
# "1 + 1 is: " + (1+1).to_s
# "There were 12 cases of a dozen eggs each (" + (12 * 12).to_s + ")"
# "His name is " + "jon".capitalize

str_intrpl_a = "1 + 1 is #{(1 + 1).to_s}"
str_intrpl_b = "There were 12 cases of a dozen eggs each - #{(12 * 12).to_s} eggs total."
str_intrpl_c = "His name is #{"zac".capitalize}"
# I took some creative liberties on the statements themselves. Interpolation is still valid.

puts str_intrpl_a
puts str_intrpl_b
puts str_intrpl_c

# 2. Convert the following set of string concatenations and conversions to just a single string using interpolation:
# "The answer to 12387 * 345 is: " + (12387 * 345).to_s + " Which is a " + "very".upcase + " big number! Even bigger than 42 * 98 * 12, which is: " + (42 * 98 * 12).to_s   

puts "The answer to 12387 * 345 is: #{(12387 * 345).to_s} 
Which is a #{"very".upcase} big number! 
Even bigger than 42 * 98 * 12, which is: #{(42 * 98 * 12).to_s}" 

# 3. Predict the output of the following code. 
puts "He's a good doctor, and thorough."
#=> He's a good doctor, and thorough.

puts '"I\'ve been at sea."'
#=> "I've been at sea."

# puts 'Maude said to him: "He's a good doctor, and thorough"'
#=> error; single-quote at position 31 closes string, then `s a good doctor, and thorough"'` breaks the code.

puts 'Out of order'.upcase
#=> OUT OF ORDER

puts "We're going to #{'sea world'.upcase}"
#=> We're going to SEA WORLD

puts "There were #{12*2/4} sheep and #{"three" + " sheepdogs"} out over at #{"Cherry".upcase} Creek."
#=> There were 6 sheep and three sheepdogs out over at CHERRY Creek.

puts '#{2*2}score and #{"7"} years ago'
#=> #{2*2}score and #{"7"} years ago; interpolation cannot be computed in single-quote strings.
