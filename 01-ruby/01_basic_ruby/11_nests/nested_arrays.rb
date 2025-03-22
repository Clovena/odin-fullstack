# Nested Arrays

scores = [
  [97, 76, 79, 93],
  [79, 84, 76, 79],
  [88, 67, 64, 76],
  [94, 55, 67, 81]
]

# Accessing elements in nested arrays

scores[0][0] # => 97
scores[2][1] # => 67
scores[1][3] # => 79

scores[0][-1] # => 93
scores[-1][0] # => 94
scores[-2][-3] # => 67

scores[0][4] # => nil
scores[4][0] # => NoMethodError (the first index refers to a nonexistent element)
# For this to return nil, try #dig
scores.dig(4, 0) # => nil
# This works on elements that would ordinarily return nil
scores.dig(0, 4) # => nil 


# Creating nested arrays 

Array.new() # => []
Array.new(3, 2) # => [2, 2, 2]
# parameters are initial size, default value
# The second argument, the default value, should always be immutable. 
# A number, boolean, symbol, or block are immutable. 
# A string, array, or rhash are *mutable* and may have unintended consequences.

mutable = Array.new(3, Array.new(2))
# => [[nil, nil], [nil, nil], [nil, nil]]

mutable[0][0] = 1000
mutable # => [[1000, nil], [1000, nil], [1000, nil]]
# This looks like it would only change the first element of the first array, 
# but it doesn't!

# To bypass this, use the following syntax:
immutable = Array.new(3) { Array.new(2) }
# => [[nil, nil], [nil, nil], [nil, nil]]
immutable[0][0] = 1000
immutable # => # => [[1000, nil], [nil, nil], [nil, nil]]
# Success!


# Adding and removing elements

scores = [
  [97, 76, 79, 93],
  [79, 84, 76, 79],
  [88, 67, 64, 76],
  [94, 55, 67, 81]
]

scores << [100, 99, 98, 97]
# => [
#   [97, 76, 79, 93],
#   [79, 84, 76, 79],
#   [88, 67, 64, 76],
#   [94, 55, 67, 81],
#   [100, 99, 98, 97] # element added here
# ]
scores[0].push(100)
# => [97, 76, 79, 93, 100]

scores
# => [
#   [97, 76, 79, 93, 100], # pushed 100 added here
#   [79, 84, 76, 79],
#   [88, 67, 64, 76],
#   [94, 55, 67, 81],
#   [100, 99, 98, 97]
# ]

scores.pop
# => [100, 99, 98, 97]

scores[0].pop
# => 100; from line 76

scores 
# => [
#   [97, 76, 79, 93], 
#   [79, 84, 76, 79],
#   [88, 67, 64, 76],
#   [94, 55, 67, 81]
# ]


# Iterating over nested arrays

lnames = [
  ["Adams", "Baker", "Clark", "Davis"],
  ["Jones", "Lewis", "Lopez", "Moore"],
  ["Perez", "Scott", "Smith", "Young"]
]

lnames.each_with_index do |row, row_index|
  puts "Row #{row_index}: #{row}"
end
# => Row 0: ["Adams", "Baker", "Clark", "Davis"]
# => Row 1: ["Jones", "Lewis", "Lopez", "Moore"]
# => Row 2: ["Perez", "Scott", "Smith", "Young"]

# To iterate over elements inside of each element,
# you must nest the enumerable method.

lnames.each_with_index do |row, i|
  row.each_with_index do |elem, j|
    puts "Row #{i}, Col #{j}: #{elem}."
  end
end
# => Row 0, Col 0: Adams
# => Row 0, Col 1: Baker
# => Row 0, Col 2: Clark
# etc.
