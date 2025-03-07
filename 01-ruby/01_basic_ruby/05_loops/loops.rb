# Loops

# loop loop
i = 0
loop do 
  puts "i is #{i}"
  i += 1
  break if i == 10
end
# A loop loop requires a break command, else it will iterate forever.
# loop loop is very uncommon. Better to use something else. 

# while loop
i = 0
while i < 10 do
  puts "i is #{i}"
  i += 1
end 
# The break condition is placed upfront.
# In this example, the loop runs with a count. 

puts "Are we there yet?"
while gets.chomp != "yes" do
  puts "Are we there yet?"
end
# In this example, the truthy expression does not use a count but rather an input.

# until loop
# until is the opposite of while. 
# while continues as long as the condition is true;
# unless continues as long as the condition is false.
# This is easier to read than negating the condition.

i = 0
until i >= 10 do
  puts "i is #{i}"
  i += 1
end

puts "Are we there yet?"
until gets.chomp == "yes" do
  puts "Are we there yet?"
end


# Ranges
(1..5) # inclusive range: 1, 2, 3, 4, 5
(1...5) # exclusive range: 1, 2, 3, 4
('a'..'d') # a, b, c, d

# for loop
# Ranges are useful in for loops if something must be executed n times 
# while also using an explicit iterator.
for i in 0..5
  puts "i is #{i}"
end

# for loops also work with arrays:
arr = [1, 2, 3, 4, 5]
for a in arr do
  puts a 
end

# In these cases, a numeric iterator is used. 
# Iterators can also take other classes:
names = ['Zac', 'Olivia', 'Michelle', 'Bob']
names.each do |name|
  puts "#{name} Ricker"
end

# If an explicit iterator is not needed:

# times loop
5.times do
  puts "Hello world!"
end

# An iterator can still be obtained in a times loop:
5.times do |num|
  puts "i is #{num}"
end

# In this way, Ruby begins indexing at 0, expectedly. 
# If a different start point is needed:

# upto loop
5.upto(10) do |num|
  print "#{num} "
end
# => 5 6 7 8 9 10

# downto loop
# Also exists in case of indexing down
10.downto(5) do |num|
  print "#{num} "
end
# => 10 9 8 7 6 5

# Both upto and downto are inclusive.

# Loops with single-line blocks can be written in a more condensed fashion. 

5.upto(10) { |num| print "#{num} " } # => 5 6 7 8 9 10

# next command
# Similar to break, next will skip any remaining code in the *current* iteration
# and carry on to the next iteration. 

i = 0
loop do
  i += 2

  if i == 4
    next 
  end

  print "#{i} "

  if i == 10
    break
  end

end
# => 2 6 8 10
# 4 is skipped over based on the if and next block.

# Recursion

def doubler(num)
  puts num
  if num < 32
    doubler(num * 2)
  end
end
# defined functions can be declared within themselves. 
