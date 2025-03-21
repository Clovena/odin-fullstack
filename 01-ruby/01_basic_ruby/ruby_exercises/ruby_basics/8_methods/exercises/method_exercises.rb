# Since lesson #8 is on methods, you will be writing the entire method.
# To gain more familiarity, look up the documentation for each hint.
# Remember to unskip the corresponding tests one at a time.

# method name: #ascii_translator
# parameter: number (an integer)
# return value: the number's ASCII character (https://www.ascii-code.com/)
# hint: use Integer#chr
def ascii_translator(num)
  if num.is_a? Integer
    num.chr
  else
    "Not a number."
  end
end

# method name: #common_sports
# parameters: current_sports and favorite_sports (both arrays)
# return value: an array containing items in both arrays
# hint: use Array#intersection
def common_sports(current_sports, favorite_sports)
  if (current_sports.is_a? Array) && (favorite_sports.is_a? Array)
    current_sports & favorite_sports
  else
    "Please submit two arrays."
  end
end

# method name: #alphabetical_list
# parameter: games (an array)
# return value: games, alphabetically sorted and duplicates removed
# hint: chain Array#uniq and Array#sort together
def alphabetical_list(games)
  if games.is_a? Array
    games.uniq.sort
  else
    "Please submit an array."
  end
end

# method name: #lucky_number
# parameter: number (an integer) with default value of 7
# return value: a string "Today's lucky number is <number>"
def lucky_number(int = 7)
  if int.is_a? Integer
    "Today's lucky number is #{int}"
  else
    "Please enter an integer."
  end
end

# method name: #ascii_code
# parameter: character (a string)
# return value: the character's ordinal number
# explicit return value: 'Input Error' if character's length does not equal 1
# hint: use String#ord
def ascii_code(char)
  if char.is_a? String
    if char.length != 1
      "Input Error"
    else
      char.ord
    end
  else
    "Not a string."
  end
end

# method name: #pet_pun
# parameter: animal (a string)
# return value: nil
# console output: if animal is 'cat', 'Cats are purr-fect!' (perfect)
# console output: if animal is 'dog', 'Dogs are paw-some!' (awesome)
# console output: otherwise, "I think <animal>s have pet-tential!" (potential)
# hint: use puts
def pet_pun(str)
  if str == "cat"
    puts "Cats are purr-fect!"
  elsif str == "dog"
    puts "Dogs are paw-some!"
  else
    puts "I think #{str}s have pet-tential!"
  end
end

# method name: #twenty_first_century?
# parameter: year (an integer)
# return value: true if the year is between 2001 - 2100, otherwise return false
# hint: use Comparable#between?
def twenty_first_century?(int)
  if int.is_a? Integer
    int.between?(2001, 2100)
  else
    "Not an integer."
  end
end
