# Arrays
# An array is denoted by square brackets. 
arr = [1, 2, 3, 4, 5]

# Elements can be obtained with an index. 
[1, 2, 3, 4, 5][0] #=> 1
arr[0] #=> 1
arr[3] #=> 4
arr[-1] #=> 5

# Hashes
# Also known as dictionaries, hashes contain key:value pairs.
dict = {
  :dog => "barks",
  :cat => "meows",
  :duck => "quacks",
}
# Note that the hash keys are declared as symbols. See ./symbols-booleans.rb for more.
# Indices work here too, but keys must be used.
dict[0] #=> nil
dict[:cat] #=> "meows" 
