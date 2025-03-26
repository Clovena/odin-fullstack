# Project Management

# Rules of Thumb: 
# 1. One class per file. 
  # Every time a new class is created, it should be in a new file.
  # All class files should live in a lib directory:
    # project_name
    # ├── lib
    # │   └── bubble_sort.rb
    # └── main.rb

# In the case of multiple files, consider subdirs that organize them. 

# project_name
# ├── lib
# │   ├── sort
# │   │   ├── bogo_sort.rb
# │   │   ├── bubble_sort.rb
# │   │   └── merge_sort.rb
# │   └── sort.rb
# └── main.rb

# There are two ways to ensure that code from one file
# can be used in other files. These are
# require_relative
# and
# require

# main.rb
require_relative 'lib/sort'

# sort.rb
require_relative 'sort/bogo_sort'
require_relative 'sort/bubble_sort'
require_relative 'sort/merge_sort'

# require_relative looks for the file specified 
# from the point of view of the file it's written in. 
# This is equivalent to, for example, 
# require_relative './lib/sort'

# main.rb
require './lib/sort'

# sort.rb
require './lib/sort/bogo_sort'
require './lib/sort/bubble_sort'
require './lib/sort/merge_sort'

# require looks for the file specified
# from the point of view of the directory from where code is running, 
# typically where main.rb lives. 


# traveling_project
# ├── lib
# │    ├── airport.rb
# │    ├── flight.rb
# │    └── hotel.rb
# └── main.rb

# lib/airport.rb
class Airport
  def introduce
    puts "I'm at the airport!"
  end
end

# lib/flight.rb
class flight
  def introduce
    puts "I'm on the flight!"
  end
end

# lib/hotel.rb
class hotel
  def introduce
    puts "I'm at the hotel!"
  end
end

# main.rb
require_relative 'lib/airport'
require_relative 'lib/flight'
require_relative 'lib/hotel'

Airport.new.introduce # => I'm at the airport!
Flight.new.introduce # => I'm on the flight!
Hotel.new.introduce # => I'm at the hotel!


# Module Wrapping, again

# not_so_green.rb
def food_opinion(food)
  `#{food} is awesome!`
end

# scheals.rb
def food_opinion(food)
  `#{food} is awful!`
end

# main.rb
require_relative 'lib/not_so_green'
require_relative 'lib/scheals'

puts food_opinion('Cereal')
# => Cereal is awful!
# Since food_opinion is defined twice, the last definition wins out.
# To avoid this overwriting, wrap methods within modules.


# not_so_green.rb
module NotSoGreen
  def self.food_opinion(food)
    `#{food} is awesome!`
  end
end
# scheals.rb
module Scheals
  def self.food_opinion(food)
    `#{food} is awful!`
  end
end
# main.rb
require_relative 'lib/not_so_green'
require_relative 'lib/scheals'

puts NotSoGreen.food_opinion('Cereal')
#=> Cereal is awesome!
puts Scheals.food_opinion('Marmite')
#=> Marmite is awful!
puts food_opinion('Cereal')
#=> Errors out - there's no longer a free floating food_opinion method to use.

