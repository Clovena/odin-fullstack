# Basic Enumerable Methods

# Enumerables are standard methods for arrays and hashes
# that Ruby includes out of the box. 

# Consider:
friends = ['Olivia', 'Izzi', 'Josh', 'Brandon', 'Dewees']
clevelanders = []

for f in friends do 
  unless f == 'Dewees'
    clevelanders.push(f)
  end
end
puts clevelanders # => ['Olivia', 'Izzi', 'Josh', 'Brandon']

# An easier, more concise, and built-in method to do such an operation
# is the #select method.

friends.select do |f|
  f != 'Dewees'
end

# Or, even more succinctly:
friends.select { |f| f != 'Dewees' }

# An alternative method, #reject, can also be used.
friends.reject { |f| f == 'Dewees' }
# Kind of harsh.


# #each
friends

friends.each do |f|
  puts "Hello, #{f}!"
end

# Equivalently:
friends.each { |f| puts "Hello, #{f}!" }

# Some formality around the |f| syntax:
# This is a block variable. It can be named anything,
# but descriptive syntax is usually helpful. 

# #each for hashes: 
my_hash = {
  one: 1,
  two: 2,
  three: 3,
}

my_hash.each do |key, value| 
  puts "On key #{key}, a value of #{value} is stored."
end

# You can also declare only one block variable, which is treated as the "pair."
# The pair will be used as an array.

my_hash.each do |pair| 
  puts "The pair is #{pair}."
end
# The pair is [:one, 1]
# The pair is [:two, 2]
# The pair is [:three, 3]
# => { :one => 1, :two => 2, :three => 3 }


# #each_with_index

friends.each_with_index do |item| 
  friend = item.upcase
  puts "HEY #{friend}!"
end

my_hash.each_with_index do |(k, v), i|
  i_sq = i * i
  puts "At index #{i}, the key-value pair of #{k} => #{v} is stored."
  puts "The index squared is #{i_sq}."
end


# #map

# The example above with item.upcase does not modify the original array.
# That's because #each and #each_with_index return the original array.

shouting_at_friends = []
friends.each do |f| 
  shouting_at_friends.push "HEY #{f.upcase}!"
end
puts shouting_at_friends
# => [
#   "HEY OLIVIA!",
#   "HEY IZZI!",
#   "HEY JOSH!",
#   "HEY BRANDON!",
#   "HEY DEWEES!",
# ]

# #map achieves the same as above, more succinctly.

friends = ['Olivia', 'Izzi', 'Josh', 'Brandon', 'Dewees']
friends.map do |f|
  f.split ''
end
# => [
#   ["O", "l", "i", "v", "i", "a"],
#   ["I", "z", "z", "i"],
#   ["J", "o", "s", "h"],
#   ["B", "r", "a", "n", "d", "o", "n"],
#   ["D", "e", "w", "e", "e", "s"]
# ]


# #select

friends.select do |f| 
  f != 'Dewees'
end
# => ['Olivia', 'Izzi', 'Josh', 'Brandon']

my_hash.select do |k, v|
  v != 2
end
# => my_hash = {
#   one: 1,
#   three: 3,
# }


# #reduce

my_nums = [5, 6, 7, 8]
sum = 0

my_nums.each do |n| 
  sum += n
end

# More succinctly: 
my_nums.reduce do |sum, n|
  sum + n
end

# This is much like Javascript, where the first block variable is the accumulator.
# The result of each iteration is stored in the accumulator. 
# By default, it takes the value of the first value in the object. 
# If the initial accumulator value is to be changed, it should be passed as an argument to #reduce. 

my_nums.reduce(1000) do |sum, n|
  sum + n
end
# => 1026

# More complex example of #reduce:
votes = ['Amba', 'Amba', 'Zhug', 'Sarita', 'Zhug', 'Amba', 'Saucy', 'Amba']
votes.reduce(Hash.new(0)) do |result, vote|
  result[vote] += 1
  result
end
# => {"Amba" => 4, "Zhug" => 2, "Sarita" => 1, "Saucy" => 1}

# Here, result takes the initial accumulator value of Hash.new(0), 
# which creates an empty hash {} where any future default values are 0.
# result, then, becomes the accumulator hash. 
# For each iteration, result[vote] finds (or generates) a k:v pair and adds 1 to the tally.
# Once the votes array is iterated through, we have a tally of all votes. 


# Bang methods

# Any method which ends in a ! is destructive to the original object. 
friends.map! do |f|
  f.split ''
end
# This will modify friends directly. 
