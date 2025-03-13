# src: https://launchschool.com/books/ruby/read/arrays#exercises

# 1. Write a program that checks to see if the number appears in the array.

arr = [1, 3, 5, 7, 9, 11]
number = 3

arr.include?(number)
# => true

# 2. What will the following programs return? What is the value of arr after each?

arr = ["b", "a"]
arr = arr.product(Array(1..3))
# arr = [["b", 1], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]
arr.first.delete(arr.first.last)
# arr = [["b"], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]
# => 1


arr = ["b", "a"]
arr = arr.product([Array(1..3)])
# arr = [["b", [1,2,3]], ["a", [1,2,3]]]
arr.first.delete(arr.first.last)
# arr = [["b"], ["a", [1,2,3]]]
# => [1,2,3]

# 3. How do you return the word "example" from the following array?
arr = [["test", "hello", "world"],["example", "mem"]]

arr.last.first

# 4. What does each method return in the following example?
arr = [15, 7, 18, 5, 12, 8, 5, 1]

arr.index(5)
# => 3 

arr.index[5]
# Error, #index requires an argument passed via ()

arr[5]
# => 8 

# 5. What is the value of a, b, and c in the following program?
string = "Welcome to America!"
a = string[6] # => "e"
b = string[11] # => "A"
c = string[19] # => nil

# 6. Debug the following code. 
names = ['bob', 'joe', 'susan', 'margaret']
names['margaret'] = 'jody'
# => error

names.index('margaret') = 'jody'

# 7. Use the each_with_index method to iterate through an array of your creation that prints each index and value of the array.
arr = ["This", "is", "an", "array"]
arr.each_with_index do |str, i|
  puts "#{str} is at index #{i}."
end

# 8. Write a program that iterates over an array and builds a new array
# that is the result of incrementing each value in the original array by a value of 2.
# You should have two arrays at the end of this program,
# the original array and the new array you've created.
# Print both arrays to the screen using the p method instead of puts.

arr = [4, 5, 3, 7]
new_arr = arr.map do |num|
  num += 2
end
