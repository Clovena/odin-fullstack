# Arrays

num_array = [1, 2, 3, 4, 5]
str_array = ["This", "is", "an", "array"]

# #new method
Array.new # => [ ]
Array.new(3) # => [nil, nil, nil]
# Declares size

Array.new(3, 7) # => [7, 7, 7]
# Declares size, default value

Array.new(3, true) # => [true, true, true]

# Indexing

str_array[0] # => "This"
num_array[2] # => 3
str_array[-1] # => "array"

str_array.first # => "This"
num_array.last # => 5

num_array.first(2) # => [1, 2]
str_array.last(3) # => ["is", "an", "array"]

# #push and #pop

num_array.push(6)
num_array << 7 # The shovel operator also works like #push and is actually preferred
# After both these operations: 
# => [1, 2, 3, 4, 5, 6, 7]
num_array.pop # => [1, 2, 3, 4, 5, 6]
num_array.pop(3) # => [4, 5, 6]
num_array # => [1, 2, 3]

# #shift and #unshift

str_array.unshift("Okay.") # => ["Okay.", "This", "is", "an", "array"]
str_array.shift # returns the shifted element: => "Okay."
str_array. # Back to => ["This", "is", "an", "array"]
str_array.shift(2) # => ["This", "is"]
str_array # => ["an", "array"]

# #delete_at
# Requires index of element to delete.
str_array = ["This", "is", "an", "other", "array"]
str_array.delete_at(3) # => "other"
str_array # => ["This", "is", "an", "array"]

# #delete
# Requires value of element to delete.
str_array = ["This", "is", "an", "other", "array"]
str_array.delete("other") # => "other"
str_array # => ["This", "is", "an", "array"]

# Adding and Subtracting Arrays

arr_a = [1, 2, 3]
arr_b = [3, 4, 5]
arr_a + arr_b # => [1, 2, 3, 3, 4, 5] the arrays concatenate
arr_a.concat(arr_b) # equivalent to the above

arr_a - arr_b # => [1, 2]
# This returns all elements of arr_a that are not present in arr_b.
# Similar to an anti-join. 
[1, 1, 1, 2, 2, 3, 4] - [1, 4]  #=> [2, 2, 3]


# Other Array Methods

[].empty? # => true
[[]].empty? # => false
[1, 2].empty? # => false

[1, 2, 3].length # => 3
[1, 2, 3].size # => 3
#size is an alias of #length.

[1, 2, 3].reverse # => [3, 2, 1]

[1, 2, 3].select { |num| num <= 2 } # => [1, 2]

[1, 2, 3].include?(3) # => true
[1, 2, "3"].include?(3) # => false

[1, 2, 3].join # => "123"
[1, 2, 3].join('-') # => 1-2-3

"This is an array".split # => ["This", "is", "an", "array"]

dupe_arr = [1, 1, 2, 2, 3, 3, 3, 3, 3]
dupe_arr.uniq # => [1, 2, 3]; not destructive
dupe_arr # => [1, 1, 2, 2, 3, 3, 3, 3, 3]

dupe_arr.uniq! # => [1, 2, 3]; destructive
dupe_arr # => [1, 2, 3]

[1, 2, [3, 4, 5], 6].flatten # => [1, 2, 3, 4, 5, 6]

[3, 6, 2, 5, 1, 4].sort # => [1, 2, 3, 4, 5, 6]

[1, 2, 3].product([4, 5])
# => [[1, 4], [1, 5], [2, 4], [2, 5], [3, 4], [3, 5]]

[1, 2, 3].sample # => random single element

# Applying methods to all elements

num_array = [1, 2, 3, 4, 5]
num_array.map { |num| num ** 2 }
# => [1, 4, 9, 16, 25]
num_array.collect { |num| num ** 2 }
# #collect is an alias to #map.

# Both #map and #collect are not destructive to the original object.
num_array
# => [1, 2, 3, 4, 5]


# Iterating thru elements
str_array = ["This", "is", "an", "array"]
str_array.each { |str| print "#{str}! " }
# => "This! is! an! array! "
# Equivalent to: 
str_array.each do |str|
  print "#{str}! "
end

str_array.each_index { |i| print "Index #{i} " }
# => "Index 0 Index 1 Index 2 Index 3 "

str_array.each_with_index { |str, i| puts "#{str} is at index #{i}" }
# "This is at index 0"
# "is is at index 1"
# "an is at index 2"
# "array is at index 3"

# ...in multi-dimensional arrays:
arr = [
  ["Zac", 4537],
  ["Olivia", 23958]
]
arr[0][0] # => "Zac"
arr[0][1] # => 4537
arr[1][0] # => "Olivia"
# etc.

# Some Advanced Tricks

# String-only arrays, e.g. ["This", "is", "an", "array"]
# can be initialized with %w. See below.

fancy_str_array = %w(This is an array too!)
# This is actually so wild
