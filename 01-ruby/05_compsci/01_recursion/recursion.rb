# Recursion

# Imagine the case of a number of randomly sized rocks.
# You want to find the heaviest rock.
# Algorithmically, you could compare two rocks, take the heavier,
# and use that as the baseline for the next comparison.
# Eventually, you will have the heaviest rock.

rocks = 30.times.map { rand(1..200) }
# puts rocks.join ', '
# 42, 162, 122, 56, 54, 4, 182, 2, 137, 173,
# 150, 43, 103, 198, 3, 21, 7, 157, 121, 190,
# 112, 197, 71, 83, 167, 25, 119, 135, 149, 52
max_rock = 0

rocks.each do |rock|
  max_rock = rock if max_rock < rock
end
puts "Heaviest rock is #{max_rock}kg."

# A recursive algo does not require a loop.
# Instead, define a method that accepts one array of values.
# # If the array has two values or fewer, return the larger.
# # If the array has more than two values, split it into two arrays.
# # Then invoke the same method two more times to handle each sub-array.

def weigh_rocks(arr)
  if arr.length <= 2 # base case
    rock_a = arr[0]
    rock_b = arr[-1]
  else
    rock_a = weigh_rocks(arr.slice!(0, arr.length / 2))
    rock_b = weigh_rocks(arr) # arr has been permanently altered by slice!
  end
  rock_a > rock_b ? rock_a : rock_b
end

rocks = 30.times.map { rand(1..200) }
puts "Heaviest rock is #{weigh_rocks(rocks)}kg."
