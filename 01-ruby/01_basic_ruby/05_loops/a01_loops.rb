# src: https://launchschool.com/books/ruby/read/loops_iterators#exercises

# 1. What does the each method in the following program return after it is finished executing?

x = [1, 2, 3, 4, 5]
x.each do |a|
  a + 1
end
# => [1, 2, 3, 4, 5]

# 2. Write a while loop that takes input from the user,
# performs an action, and only stops when the user types "STOP".

input = ''
until input == "STOP" do
  puts "I'm gonna keep going."
  input = gets.chomp
end

# 3. Write a method that counts down to zero using recursion. 
def countdown(num)
  if num <= 0
    puts num
  else 
    puts num
    countdown(num - 1)
  end
end
