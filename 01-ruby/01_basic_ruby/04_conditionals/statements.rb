# Case statements

# Case...when can be used as a more succinct alternative to many if...elsif
full_name = "Zachary Ricker"

greeting = case full_name
  when "Undefined" then "Hello stranger!"
  when "Zachary Ricker" then "Hello Zac!"
  else "What's your name?"
end 

# case...when can also be used for more complex code manipulation.
# Take out `then` and insert blocks.

greeting = case full_name
  when "Undefined"
    "Hello stranger!"
    is_known = false
  when "Zachary Ricker"
    "Hello Zac!"
    is_known = true
  else 
    "What's your name?"
    is_known = nil
  end

# Another way to write this is by simply initializing case 
case
  when full_name == "Undefined"
    "Hello stranger!"
  when full_name == "Zachary Ricker" 
    "Hello Zac!"
  else 
    "What's your name?"
end


# Ruby also has an `unless` statement, which is just `if not` by another name.
unless full_name == "Zachary Ricker"
  "Hello stranger!"
end 

# else can be used here too. 
unless full_name == "Zachary Ricker"
  "Hello stranger!"
else 
  "Hello Zac!"
end

# Like in the example puts "Hello" if 1 < 2, 
# unless can be used with this sort of reversed syntax.
puts "Hello stranger!" unless full_name == "Zachary Ricker"

# Ternary Operator

# Like in Javascript, there exists in Ruby a syntax like
# `condition ? <execute if true> : <execute if false>`

is_known = full_name == "Zachary Ricker" ? "Yes" : "No"
puts is_known #=> "Yes" 
# This is a good example of using a ternary operator to select between two values, 
# rather than choose between two actions. 
