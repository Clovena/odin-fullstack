# Lambdas

# A lambda is a way to save a block into a variable.
# This is useful when calling different methods,
# but passing the same block to each of them.

# To create a lambda:
my_lambda = lambda { puts 'my lambda' } # rubocop:disable Style/Lambda
my_other_lambda = -> { puts 'hello world' }
# Either lambda or the stabby lambda -> syntax

# To call a lambda, just use #call:
my_lambda.call
# => my lambda

# To accept arguments into a lambda...
# with the lambda keyword:
my_age = ->(age) { puts "I am #{age} years old." }
# with the stabby lambda:
my_height = ->(height) { puts "I am #{height} tall." }

my_age.call(28)
# => I am 28 years old.
my_height.call("6'1\"")
# => I am 6'1" tall.

# There are technically other ways to call a lambda:
my_age.call(28)
my_age.(28) # rubocop:disable Style/LambdaCall
my_age[28]
my_age.=== 28 # rubocop:disable Style/CaseEquality
# .call is best though.

# Procs

# A Proc is an object that can be used to store blocks
# and pass them around like variables.
# Technically, a lambda is a type of Proc object.

my_proc = Proc.new { puts 'this is a proc' } # rubocop:disable Style/Proc
my_proc.call
# => this is a proc

# Or, more succinctly:
another_proc = proc { puts 'this is a proc too' }
another_proc.call
# => this is a proc too

# Arguments are always declared inside || pipes
bio = proc { |name, age| puts "#{name} is #{age} years old." }
bio.call('Zac', 28)
# => Zac is 28 years old.

# Procs vs Lambdas

# 1. Procs do not care about an exact number of arguments.
# They will pass nil to any missing arguments.
# Lambdas DO care about the exact number of arguments.
# They will throw an error if the wrong number of args are given.

# 2. When a lambda contains an explicit return,
# it returns from the lambda block back to the caller.
# A proc object returns from the context in which it is called.
a_proc = proc.new { return }
a_proc.call
# => localJumpError (unexpected return)
# If a proc returns inside a method, the method serves as
# the context in which it was called.
# Therefore, it returns from the method itself before any below code is executed.
def my_method
  a_proc = proc { return }
  puts 'this line will be printed'
  a_proc.call
  puts 'this line is never reached'
end
my_method
# => this line will be printed

# Similarities do exist, though.

# Both procs and lambdas support default arguments.
my_proc = proc { |name = 'bob'| puts name }
my_proc.call
# => bob

my_lambda = ->(name = 'r2d2') { puts name }
my_lambda.call
# => r2d2

# Both procs and lambdas can be used as arguments to a method.
def my_method(arg)
  arg.call
end

my_lambda = -> { puts 'lambda' }
my_proc = proc { puts 'proc' }

my_method(my_lambda) # => lambda
my_method(my_proc) # => proc

# Capturing Blocks

# Now, let's get to the good stuff.
# Ruby allows for capturing blocks in a method definition
# using a special argument denoted with &

def method(&my_block)
  my_block.call
end
method { puts 'Cool!' }
# The block-capturing & parameter should always be last
# in the case of multiple parameters.

# Technically speaking, the & syntax provokes Ruby
# to call a method called #to_proc on what's assigned to the variable.
# In the above, & calls #to_proc on my_block, creating a proc object.
# From there, #call can be used on the new proc object.

arr = %w[1 2 3]
arr.map(&:to_i)
# Here, & calls #to_proc on the symbol :to_i,
# which points to the method #to_i.

# & works the other way as well:
def method
  # This method accepts ZERO arguments
  yield
end

my_proc = proc { puts 'Here\'s my proc!' }
method(my_proc) # => ERROR, expects ZERO arguments but gets one.
method(&my_proc) # => Here's my proc!
