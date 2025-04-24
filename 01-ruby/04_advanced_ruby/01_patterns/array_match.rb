###
# Array Pattern Match
###

# Matching against Arrays can be done in a few ways.
# Most basic is to match against the exact elements.

arr = [1, 2, 3]
case arr
in [1, 2, 3] then puts :match
in [3, 4, 5] then puts :no_match
end
# => match

# Element type can also be matched
case arr
in [Integer, Integer, Integer] then puts :match
in [String, String, String]    then puts :no_match
end
# => match

# If the number of elements is misaligned:
case arr
in [Integer, Integer] then puts :no_match
end
# NoMatchingPatternError

# To match against only part of an Array:
case arr
in [Integer, Integer, *]
  puts :match
end
# => match
# The splat * is used! An old familiar friend.

case arr
in [Integer, *, Integer]
  puts :match
end
# => match

case arr
in [*, 3] then puts :match
end
# => match

# If the splat-matched values are desired as a return:
case arr
in [1, 2, *tail]
  p tail
end
# => [3]

# To save specific values individually (not with splat):
case arr
in [1, a, b]
  puts a
  puts b
end
# => 2
# => 3

# If some values don't matter, but the indices matter:
case arr
in [_, 2, _]
  puts :match
end
# => match

# Let's say you want to match against an array of two numbers,
# but only if they aren't the same number:

arr = [1, 2]
case arr
in [a, b] unless a == b
  puts :match
end
# => match

# For nested arrays:
arr = [1, 2, [3, 4]]
case arr
in [_, _, [3, 4]]
  puts :match
end
# => match

# Consider a nested array: you may want to match against both the nested array
# as well as some individual parts of it.
# As can be used here:

case [1, 2, 3, [4, 5]]
in [1, 2, 3, [4, a] => arr]
  p a
  p arr
end
# => 5
# => [4, 5]
# Here, the Variable Pattern Match assigns 5 to a.
# Additionally, the rocket As assigns [4, 5] to arr.

# One final point: the [] brackets are optional on the outer array.
arr = [1, 2, 3, 4]
case arr
in 1, 2, 3, 4
  puts :match
end
# => match
