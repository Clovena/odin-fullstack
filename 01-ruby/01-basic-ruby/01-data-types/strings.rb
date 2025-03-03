# Concatenation

# With the plus operator:
"Welcome " + "to " + "Odin!" #=> "Welcome to Odin!"

# With the shovel operator:
"Welcome " << "to " << "Odin!" #=> "Welcome to Odin!"

# With the concat method:
"Welcome ".concat("to ").concat("Odin!") #=> "Welcome to Odin!"

# Substrings

# With a singular index: 
"hello"[0] #=> "h"

# With two indices, separated by two dots: 
"hello"[0..1] #=> "he"

# With two indices, separated by a comma: 
"hello"[0, 4] #=> "hell"

# Can also index from the end
"hello"[-1] #=> "o"

# Returns nil if index is out of bounds
"hello"[12] #=> nil

# Escape characters
# \s  #=> Space
# \t  #=> Tab
# \n  #=> Newline
# \r  #=> Carriage return
# \b  #=> Backspace
# \"  #=> Double quotation mark
# \'  #=> Single quotation mark
# \\  #=> Single backslash

puts "Hello\n\nWorld"
puts "Hello\tWorld"
puts "Hello\b\b\b went that way!"

# Interpolation

# Interpolation in Ruby requires double-quotes.
# This works similarly to Javascript's `` quotes and the ${ } interpolation.
name = "Odin"
puts "Hello, #{name}" #=> "Hello, Odin"
puts 'Hello, #{name}' #=> "Hello, #{name}"

# Some more useful string methods:
str = "hello world"

str.empty? #=> false
''.empty? #=> true

str.include?("lo") #=> true
str.include?("z") #=> false

str.upcase #=> "HELLO WORLD"
str.downcase #=> "hello world"
"hELLO wORLD".swapcase #=> "Hello World"
str.capitalize #=> "Hello world"

str.length #=> 11
str.count('l') #=> 3

str.reverse #=> "dlrow olleh"

str.split #=> ["hello", "world"] by default, splits by whitespace
str.split('') #=> ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]

"  hello world    ".strip #=> "hello world"
# removes leading and trailing \s, plus all \t, \n, \r

"he77o".sub("7", "l") #=> "hel7o"
"he77o".gsub("7", "l") #=> "hello"

"hello".insert(-1, " dude") #=> "hello dude"

str.delete("l") #=> "heo word"

"!".prepend(str) #=> "hello world!"

str.chop #=> "hello worl"
"Hello\r".chomp #=> "Hello"
str.chomp #=> "hello world"
# #chomp removes the last character iff it is \n or \r

15.to_s #=> "15" 
"15".to_i #=> 15
# #to_i also works on string classes, presuming that an integer can be obtained

str.clear #=> ""
