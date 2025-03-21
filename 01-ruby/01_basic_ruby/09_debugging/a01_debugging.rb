# src: https://launchschool.com/books/ruby/read/more_stuff#exercises

# 1. Write a program that checks if the sequence of characters "lab" exists
# in the following strings. If it does exist, print out the word.

# laboratory, experiment, Pans Labyrinth, elaborate, polar bear

def has_lab?(str)
  check = str.to_s.downcase
  if check.include?("lab")
    puts str
  else 
    puts "No match."
  end
end
has_lab?("laboratory")
has_lab?("experiment")
has_lab?("Pans Labyrinth")
has_lab?("elaborate")
has_lab?("polar bear")

# 2. Debug the following code. 

# def execute(block)
def execute(&block) # block requires ampersand &
  block.call
end

execute { puts "Hello from inside the execute method!" }
