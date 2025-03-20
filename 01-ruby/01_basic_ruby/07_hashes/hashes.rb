# Hashes

my_hash = Hash.new # => {}

my_hash = {
  "a random word" => "ahoy",
  "Dorothy's math test score" => 94,
  "an array" => [1, 2, 3],
  "an empty hash within a hash" => {},
}

my_hash["an array"] # use keyname, not index, to obtain value
# => [1, 2, 3]

my_hash["nonexistent"] # => nil 
# This may cause problems with a return of nil, so an alternative method can be used:
my_hash.fetch("nonexistent")
# => KeyError: key not found: "nonexistent"

# the #fetch method can be given a default value if no hash value is found
my_hash.fetch("nonexistent", "nothing here")
# => "nothing here"

# A new value can be set by indexing: 
my_hash["a new key"] = "a new value"

# A value can be changed in this same way:
my_hash["Dorothy's math test score"] = 98


# Other Hash Methods

my_hash.delete("an empty hash within a hash")

my_hash.keys
# => ["a random word", "Dorothy's math test score", "an array", "a new key"]
my_hash.values
# => ["ahoy", 98, [1, 2, 3], "a new value"]

my_hash.key?("a new key") # => true
my_hash.key?("not a key") # => false

my_hash.value?("ahoy") # => true
my_hash.value?("not a value") # => false

my_hash.select { |k, v| k == "a random word" }
# => {"a random word" => "ahoy"}
my_hash.select { |k, v| (k == "a random word") || (v == 98) }
# => {"a random word" => "ahoy", "Dorothy's math test score" => 98}

my_hash.to_a # returns an array version of the hash
# => [
#   ["a random word", "ahoy"], 
#   ["Dorothy's math test score", 98],
#   ["an array", [1, 2, 3]],
#   ["a new key", "a new value"],
# ]

my_other_hash = {
  "shoes" => "adidas",
  "socks" => "dickies",
  "belt" => "nordstrom",
  "num_shirts" => 14,
}
my_hash.merge(my_other_hash)
# with merge, if the two hashes have the same key, the value will be overwritten from the original hash
# and the value passed through the #merge method will be used.


# Symbols as Keys

# 'Rocket' syntax
american_cars = {
  :chevrolet => "Corvette",
  :ford => "Mustang",
  :dodge => "Ram",
}
# 'Symbols' syntax
japanese_cars = {
  honda: "Accord",
  toyota: "Corolla",
  nissan: "Altima",
}

# To retrieve these values:
american_cars[:ford] # => "Mustang"
japanese_cars[:honda] # => "Accord"

# Other possible keys
my_weird_hash = {
  12345 => "one-two-etc",
  "ten-nine-etc" => 109876,
  ["Array"] => "array as a key",
  :sym => "symbol as a key",
  {key: "value"} => "hash as a key?!",
}


# Iterating over Hashes

american_cars.each do |key, value|
  puts "#{value} is manufactured by #{key}."
end
# Iterating over a hash requires two variables declared:
# one for the key and one for the value.


# Hashes as Optional Parameters

def greeting(name, options = {})
  if options.empty?
    puts "Hi, #{name}!"
  else
    puts "Hi, #{name}! You live in #{options[:city]} and are #{options[:age]} years old."
  end
end

greeting("Zac")
greeting("Zac", {age: 28, city: "Cleveland"})
# The following syntax is equivalent to the above:
greeting("Zac", age: 28, city: "Cleveland")
# No curly braces needed when the last argument of a function is a hash.