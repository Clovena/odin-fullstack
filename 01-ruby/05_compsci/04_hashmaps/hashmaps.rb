# Hash Maps

# Hash maps are similar to conventional Ruby Arrays,
# except it uses keys as indices rather than sequential numbering.

# First, to hash a value is to input a value
# and generate a corresponding output.
# Hashing the same input should always return the same hash code,
# there should be no random generation component.

def hash(name)
  name[0]
end
# This is the most simple form of hashing.
# Hashing is different than ciphering because of
# its inability to be reversed.
# An encryption can be decrypted; a hash can not be de-hashed.

# The trouble with the above is that many names can receive
# the same hash. Zac, Zoe, and Zebra will all be hashed to Z.

def hash(name, surname)
  name[0] + surname[0]
end
# This is better, but duplication can still emerge.

def str_to_num(str)
  hash = 0
  str.each_char { |char| hash += char.ord }
  hash
end

def hash(name, surname)
  str_to_num(name) + str_to_num(surname)
end
puts hash('Zac', 'Ricker') # => 894
puts hash('Olivier', 'Messiaen') # => 1551

# Buckets
# Buckets are storage needed to house elements. Simply, an array.
# For a specific key, we decide which bucket to use for storage
# through our hash method.

# Let's say we want to store a k-v pair of 'Zac' => 'Ricker'

# 'Zac' hashes to 286.
# Find the bucket at index 286.
# Store the entire pair 'Zac' => 'Ricker' in the bucket.

# To get a value, then, using a key:
# Hash the key to calculate the bucket number.
# Go to the bucket, if it is not empty.
# Find the k-v pair in the bucket based on the key.

# Collisions
# A collision occurs when two different keys
# generate the exact same hash code and land in the same bucket.

# In the str_to_num example below, 'Zac' and 'acZ'
# will technically generate the exact same hash code.
# Let's refactor the method to give a unique hash
# based on the order of letters.
def str_to_num(str)
  hash = 0
  prime = 31
  str.each_char do |char|
    hash = (prime * hash) + char.ord
  end
  hash
end

def hash(name, surname)
  str_to_num(name) + str_to_num(surname)
end
puts hash('Zac', 'Ricker') # => 2447705064
puts hash('Olivier', 'Messiaen') # => 2284816268421

# Growth of a hash table

# The number of buckets can't be infinite.
# Common practice is to start with 16 buckets
# and work gradually outward as needed.
# The use of modulo (% 16) gets all hashes (like those generated above)
# to a value between 0 and 15.
# The trouble is, this causes collisions.
# In a perfect world, each bucket will have either 0 or 1 node.
# So, when we need to grow our buckets, we'll double the old list of buckets
# and copy all nodes from the old to the new. 

# A hash map class needs to keep track of two fields:
@capacity # the present total number of buckets 
@load_factor # the factor that determines when bucket growth is needed.
# Common load_factor values are between 0.75 and 1.

# The product of capacity and load_factor gives us the upper threshold
# above which more buckets are necessary.
@capacity = 16
@load_factor = 0.8
product = 16 * 0.8 = 12.8
# So after 12.8 buckets, make new buckets.