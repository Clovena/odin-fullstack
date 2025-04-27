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
