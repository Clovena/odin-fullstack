# Time Complexity

def odds_under_ten
  current = 1
  while current < 10
    puts current if current % 2 != 0 # rubocop:disable Style/EvenOdd
    current += 1
  end
end
# This program may take varying amounts of time depending on
# compute power, background processes, etc.

# Consider the number of steps it takes to run this program:
# 1. We assign the number 1 to a variable. That is 1 step.
# 2. We have a loop. For each iteration of the loop, we do the following:
#   a. Compare current to see if it is less than 10. That is 1 step.
#   b. We then check if current is odd. That is 1 step.
#   c. If it is then we output it to the terminal. That is 1 step every 2 iterations.
#   d. We increase current by 1. That is 1 step.
# 3. To exit the loop, we need to compare current one last time
# to see that it is not less than ten any more. That is 1 step.

# All this in mind, 34 steps are required to finish this algo.

# If 10 is changed to be a variable value, the steps needed will vary.
def odds(max)
  current = 1
  while current < max
    puts current if current % 2 != 0 # rubocop:disable Style/EvenOdd
    current += 1
  end
end
# This method takes various steps based on the `max` value provided.
# Therefore, we need to measure how the number of steps changes
# based on changes in the data.

# Asymptotic Notations
# These notations are used to describe the runtime of an algo.
# 1. Big O Notation represents the upper-bound (worst-case) of an algo.
# 2. Omega Notation represents the lower-bound (best-case).
# 3. Theta Notation represents an average case complexity.
# Big O is most common, since it's worst-case.

# Big O Notations:
# O(1) - constant complexity
# O(log N) - logarithmic complexity
# O(N) - linear complexity
# O(N log N) - N x log N complexity
# O(n^2) - quadratic complexity
# O(n^3) - cubic complexity
# O(2^n) - exponential complexity
# O(N!) - factorial complexity

# O(1) Constant Complexity
arr = [1, 2, 3, 4, 5]
# To look up what is at index 2:
arr[2] # => 3; this takes one step
# If arr gets bigger:
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr[7] # => 8, this still takes one step
# Since this task always takes one step,
# no matter the size of arr,
# the complexity is constant.

# O(log N) Logarithmic Complexity
# This type of complexity indicates that the number of steps
# increases by 1 as the data *doubles*.

# O(N) Linear Complexity
# As the data grows, the number of steps grows at exactly the same rate.
# An array of 4 items can be iterated through in 4 steps.
# An array of 9 items can be iterated through in 9 steps.

# O(N log N) Complexity
# This is similar to log-N complexity
# but each half of the data is processed by an O(N) algo.

# O(n^2) and O(n^3) Quadratic / Cubic Complexity
# Basically, double-nested or triple-nested loops.

# O(2^n) Exponential Complexity
# Inverse of log-N complexity, where each item added to the data size
# doubles the number of steps.
# This should be avoided if at all possible,
# since powers of 2 spiral out of control quickly.

# O(N!) Factorial Complexity
# This occurs mainly in permutations / combinations.
# This also spirals quickly.
