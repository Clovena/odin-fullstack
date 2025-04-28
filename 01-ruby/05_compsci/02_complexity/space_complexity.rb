# Space Complexity

# Space complexity is the total space used by an algo
# relative to the size of the input.
# "Space" refers to that which is used by the algo input
# AND the auxiliary space, the extra algo space
# like temp variables within the algo.
# Auxiliary space has no lasting impact on memory
# but they do play into the algo complexity.

# While time can be extended, i.e. let the script run longer,
# space is not as easily extended. Memory is finite,
# and cannot be added on the fly.

# Big O notation is also used in space complexity.

def multiply(x, y)
  x * y
end
# This is O(1) complexity. Argument size does not change
# the space the algo requires.

def sum_arr(arr)
  copy_arr = arr.dup
  sum = 0
  copy_arr.each do |num|
    sum += num
  end
  sum
end
# This is O(N) complexity since the amount of space held in memory
# is dependent upon the size of arr.
