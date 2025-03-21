# Predicate Enumerable Methods

# #include?

numbers = [5, 6, 7, 8]
search = 6
result = false

numbers.each do |n|
  if n == element
    result = true
    break
  end
end
result # => true

search = 3
result = false

numbers.each  do |n|
  if n == element
    result = true
    break
  end
end
result # => false

# To clean this up and streamline: 

numbers.include?(6) # => true
numbers.include?(3) # => false

friends = ['Olivia', 'Izzi', 'Josh', 'Brandon', 'Dewees']
clevelanders = friends.select do |f| 
  f != 'Dewees'
end
clevelanders.include?('Dewees') # => false


# #any? 

# Check if any number is greater than 7

numbers
result = false

numbers.each do |n|
  if n > 7
    result = true
    break
  end
end
result # => true

# More succinctly: 
numbers.any? { |n| n > 7 }
# => true

numbers.any? do |n|
  n < 3
end
# => false

# Similarly, #all :
numbers
numbers.all? do |n|
  n > 5
end
# => false

numbers.all? { |n| n < 10000 }
# => true

# #none?
numbers
numbers.none? { |n| n > 100 }
# => true; no elements in `numbers` are greater than 100

numbers.none? do |n| 
  n < 7
end
# => false; there exists at least one element in `numbers` less than 7
