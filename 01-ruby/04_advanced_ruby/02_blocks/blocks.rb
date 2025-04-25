# Blocks

# To recap: a block can be declared as a single line or multiple lines.
# They are enclosed by { } in single lines, or do..end in multiple lines.
# Parameters are passed to a block using pipes |arg1, arg2|

# Single-line block
[1, 2, 3].each { |num| puts num }

# Multi-line block
[4, 5, 6].each do |num|
  puts num
end

# Besides Enumerable methods, blocks can be used
# as arguments for custom methods or even as values for variables.

# Yield

# yield is a keyword in Ruby that can be called inside a method
# to relinquish execution to the accompanying block.

# As an example: imagine a method to log information to the terminal.
# The one key requirement is that the user should define how it is presented.
# Sometimes puts, sometimes p.

def log
  yield
end

log { puts 'hello from the block' }
log do
  p [1, 2, 3]
end

# Multiple calls of yield will behave the same way each time:

def double_log
  yield
  yield
end
double_log { p 'Hello from the block again' }

# Blocks can accept arguments:

def love
  yield 'Ruby'
  yield 'Rails'
end

love { |elem| puts "I love #{elem}!" }
# => I love Ruby!
# => I love Rails!

# To put this to better use, yield and #each can be combined:

@transactions = [10, -15, 25, 30, -24, -70, 999]
def transaction_statement
  @transactions.each do |t| # rubocop:disable Style/ExplicitBlockArgument
    yield t
  end
end

# Now call the method:
transaction_statement do |t|
  p '%0.2f' % t # rubocop:disable Style/FormatString
end
# => ["10.00", "-15.00", "25.00", "30.00", "-24.00", "-70.00", "999.00"]

# To control the format of the transactions, but not the print format,
# move the p to the method definition:
def transaction_statement
  @transactions.each do |t|
    p yield t
  end
end

# Now call the method:
transaction_statement do |t|
  '%0.2f' % t # rubocop:disable Style/FormatString
end
# => ["10.00", "-15.00", "25.00", "30.00", "-24.00", "-70.00", "999.00"]

# To gather the value returned from the block:
def transaction_statement
  formatted_transactions = []
  @transactions.each do |t|
    formatted_transactions << yield(t)
  end
  p formatted_transactions
end

# Now call the method:
transaction_statement do |t|
  '%0.2f' % t
end
