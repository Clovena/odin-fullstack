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

###
# Hash Pattern Match
###

# Similar to hashes except:
# Pattern matching only works for Symbol keys, NOT String keys.
# Partial matching can be done without regard for additional k-v pairs.

case { a: 'apple', b: 'banana' }
in { a: 'aardvark', b: 'bat' }
  puts :no_match
in { a: 'apple', b: 'banana' }
  puts :match
end
# => match

# Variable assignment can be done here as well:
case { a: 'apple', b: 'banana' }
in { a: a, b: b }
  puts a
  puts b
end
# => apple
# => banana

# For some reason, this works too
case { a: 'apple', b: 'banana' }
in { a:, b: }
  puts a
  puts b
end
# => apple
# => banana

# And you can omit the brackets here as well:
case { a: 'apple', b: 'banana' }
in a:, b:
  puts a
  puts b
end
# => apple
# => banana

# To save multiple k-v pairs, use a double splat **
case { a: 'ant', b: 'ball', c: 'cat' }
in { a: 'ant', **tail }
  p tail
end
# => { :b => 'ball', :c => 'cat' }

# Important to recognize that hashes will match with subsets,
# so guards are required to prevent that behavior.
case { a: 'ant', b: 'ball' }
in { a: 'ant' }
  'this will match'
in { a: 'ant', b: 'ball' }
  'this will never be reached'
end

# To ensure an exact match, use **nil
case { a: 'ant', b: 'ball' }
in { a: 'ant', **nil }
  puts :no_match
in { a: 'ant', b: 'ball' }
  puts :match
end
# => match

# This can be visualized by using As:
case { a: 'ant', b: 'ball' }
in { a: 'ant' } => hash
  p hash
end
# => { :a => 'ant', :b => 'ball' }
