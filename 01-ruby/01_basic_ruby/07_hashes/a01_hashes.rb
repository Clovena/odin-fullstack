# src: https://launchschool.com/books/ruby/read/hashes#exercises

# 1. Given a hash of family members, with keys as the title
# and an array of names as the values, use Ruby's built-in select method
# to gather only siblings' names into a new array.

family = {
  uncles: ["bob", "joe", "steve"],
  sisters: ["jane", "jill", "beth"],
  brothers: ["frank","rob","david"],
  aunts: ["mary","sally","susan"],
}

siblings = family.select do |k, v| 
  k == :sisters || k == :brothers
end
siblings_arr = siblings.values.flatten

# 2. Look at Ruby's merge method. Notice that it has two versions.
# Identify the difference the difference between merge and merge!
# Write a program that uses both and illustrate the differences.

orig_hash = {
  name: "Zac",
  age: 28,
  city: "Cleveland",
}

added_hash = {
  occupation: "Industry Analyst",
}

orig_hash.merge(added_hash)
# => returns four key-value pairs
orig_hash # => returns THREE key-value pairs

orig_hash.merge!(added_hash)
# => returns four key-value pairs
orig_hash # => returns FOUR key-value pairs

# 3. Using some of Ruby's built-in Hash methods,
# write a program that loops through a hash and prints all of the keys.
# Then write a program that does the same thing except printing the values.
# Finally, write a program that prints both.

def provide_keys(hash)
  keys = hash.keys.flatten
  keys.each do |k| 
    puts k
  end
end

def provide_values(hash)
  values = hash.values.flatten
  values.each do |v|
    puts v
  end
end

def provide_pairs(hash)
  hash.each do |k, v|
    puts "#{k} is mapped to #{v}"
  end
end

provide_keys(orig_hash)
provide_values(orig_hash)
provide_pairs(orig_hash)
