# src: https://www.codequizzes.com/computer-science/beginner/recursion

# 1. Define a recursive function that finds the factorial of a number.
def factorial(num)
  return 1 if num.zero?

  num * factorial(num - 1)
end
puts factorial(5) # 120

# 2. Define a recursive function that returns true
# if a string is a palindrome, false otherwise.
def palindrome?(str)
  return true if str.length <= 1

  if str[0] == str[-1]
    palindrome?(str[1..-2])
  else
    false
  end
end
puts palindrome?('racecar') # true

# 3. Define a recursive function that takes an argument n
# and returns the Fibonacci value of that position.
def fibonacci(num)
  return num if num <= 1

  fibonacci(num - 1) + fibonacci(num - 2)
end
puts fibonacci(9) # 34
