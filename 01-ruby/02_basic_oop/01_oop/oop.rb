# Object Oriented Programming

# OOP is a means of creating containers for data that can be changed
# and manipulated without affecting the entire program.

# Definitions

## Encapsulation:
# Bundles data and related operations into a single entity, i.e. an object.
# Hides functionality from the rest of the code base, protecting data.


## Polymorphism:
# The ability for different types of data to respond to a common interface.


## Inheritance:
# The act of acquiring behaviors of another class. 
# Allows for the creation of large superclasses containing behaviors with
# large reusability, and then subclasses for more detailed behaviors.


# Defining classes

# good_dog.rb
class GoodDog 
end

spotty = GoodDog.new
# In technical terms, we have "instantiated" an object called spotty 
# from the class `GoodDog`.

# Defining modules

module Speak
  def speak(sound)
    puts sound
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

spotty = GoodDog.new
spotty.speak("Woof") # => Woof

zac = HumanBeing.new
zac.speak("Hello world") # => Hello world


# Initializing a new object 

class GoodDog
  def initialize # name not optional. Must be called initialize.
    puts "This object has been initialized."
  end
end

spotty = GoodDog.new
# => "This object has been initialized."

# In this case, the #puts method is called when a new object is created,
# causing the message to be output immediately upon creation. 


# Instance Variables

class GoodDog
  def initialize(name)
    @name = name
  end
end

# Here, an instance variable is declared using @
spotty = GoodDog.new("Spotty")
# Now, spotty's @name variable is set to "Spotty"


# Composition:
# Relationship where an object - the container - contains
# one of more objects of other classes as part of its state.

class Engine
  def startup
    puts "Engine starting..."
  end
end

class Car 
  def initialize
    @engine = Engine.new
    # an instance of Engine is created when Car is created
  end

  def startup
    @engine.startup
  end
end

my_car = Car.new
my_car.startup # => Engine starting...

# Car contains an instance of Engine.

# Aggregation:
# Relationship where an object container has a reference to other objects,
# but those objects also exist independently of the container.

class Passenger
end

class Car 
  def initialize(passengers)
    @passenger = passengers
  end
end

friends = [Passenger.new, Passenger.new]
# Passenger can exist without Car
my_car = Car.new(friends)

# TL;DR:
# Composition: The container *owns* the contained objects.
# Aggregation: The container does not own the contained objects; they can exist independently.


# Instance Methods

class GoodDog
  def initialize(name)
    @name = name 
  end

  def speak
    "Woof"
  end

  def say_hello
    "#{@name} says hello!"
  end
end

spotty = GoodDog.new("Spotty")
spotty.speak # nothing returns
puts spotty.speak # => Woof
puts spotty.say_hello # Spotty says hello!

fufi = GoodDog.new("Fufi")
puts fufi.speak # => Woof
puts fufi.say_hello # Fufi says hello!

# Here, both spotty and fufi have the same behaviors, 
# but they contain different states. The differing state is the name.


# Accessor Methods

# There is no instrinsic method to retrieve the value in @name
# or any instance variable. To access such a value, a method must be created
# to return the instance variable value.

# Also, there is no intrinsic method to change the value in an instance variable.
# To do such a thing, a method must be created to change the value.

class GoodDog
  def initialize(name)
    @name = name
  end

  def get_name # This is called a "getter" method
    @name
  end

  def set_name=(name) # This is called a "setter" method
    @name = name
  end
  # The syntax here allows for shorthand later.
  # Generally, this would be called with obj.set_name=("New Name")
  # But the equals sign in the method name declares a setter method.
  # obj.set_name = "New Name" is the shorthand now allowed.

end

spotty = GoodDog.new("Spotty")
puts spotty.get_name # => Spotty

# Proper syntax calls for the getter and setter to be called 
# the same thing as the instance variable they are exposing and declaring.
# See below for proper syntax on the GoodDog class.

class GoodDog
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(n)
    @name = n
  end

  def speak
    "#{@name} says woof!"
  end
end

my_dog = GoodDog.new("Fufi")
puts my_dog.speak # => Fufi says woof!
puts my_dog.name # => Fufi
my_dog.name = "Spotty"
puts my_dog.speak # => Spotty says woof!

# This is proper, but it is long. There is a shorthand in Ruby:
class GoodDog
  # def name
  #   @name
  # end

  # def name=(n)
  #   @name = n
  # end
  attr_accessor :name # This single line does the job of all of the above!

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says woof!"
  end
end

# If you want read-only (getter) or write-only (setter),
# there is also attr_* syntax for that 

class PersonBio
  attr_accessor :name, :gender, :height
  # Syntax like this can be used when there are multiple instances.
  attr_reader :birthday, :age
  attr_writer :weight, :ssn
  # Recall that these effectively create two methods each,
  # one for getting, e.g. def name { @name } and 
  # one for setting, e.g. def name=(n) { @name = n }

  def hbd
    "#{name}'s birthday is #{birthday}."
    # Notice here that we are no longer called the instance variable @name
    # but rather the instance method #name created above.
  end

  def ssn
    'xxx-xx-' + @ssn.split('-').last
  end
  # An example like this, a more complex getter method,
  # allows operation(s) to be performed throughout the class. 
  # Without this, the line 'xxx-xx-' + @ssn.split('-').last
  # would have to be performed in all occurrences of @ssn.

  # Now, consider the possibility to change several states at once.
  # This can be done with an instance method that sets multiple instance variables.
  def change_info(n, g, h, w)
    self.name = n
    self.gender = g
    self.height = h 
    self.weight = w 
  end
    # Here, we could also call the instance variables @name, @gender, etc. 
    # But to be consistent with the above, it's better to call the instance methods.
    # However, this requires the addition of self. This declares that a setter method
    # is being called, rather than a local variable being created within #change_info.

  def info 
    "#{self.name} (#{self.gender}) is #{self.height} and weighs #{self.weight}lbs."
  end
  # Getter methods do not require the self. syntax, but it can be adopted for consistency.
  # General Ruby style guides recommend that self should be avoided where not required.

end


# Class Methods & Variables

# As implied, these are methods that can be called on the class itself.

class GoodDog
  def self.what_am_i
    "I'm a GoodDog class!"
  end
end

GoodDog.what_am_i # => I'm a GoodDog class!

class GoodDog

  @@dog_count = 0 
  # This is a class variable, denoted with two at-signs.
  # These capture information for an entire class.

  def initialize
    @@dog_count += 1
  end

  def self.number_of_dogs
    @@dog_count
  end

end

puts GoodDog.number_of_dogs # => 0
spotty = GoodDog.new
fufi = GoodDog.new

puts GoodDog.number_of_dogs # => 2


# Constants

# Ruby explicitly defines constants with an uppercase first letter like Constant,
# but style conventions suggest YELLING_SNAKE_CASE

class GoodDog
  DOG_YEARS = 7
  attr_accessor :name, :age

  def initialize(name, age)
    self.name = name
    self.age = age * DOG_YEARS
  end

end

fufi = GoodDog.new("Fufi", 3)
puts fufi.age # => 21


# #to_s

puts fufi #<GoodDog:0x00000001015f4a90>
# The computation here involves #puts automatically calling #to_s
# By default, #to_s returns the name of the object's class
# and an encoding of the object id.

# This behavior can be overwritten: 

class GoodDog
  DOG_YEARS = 7
  attr_accessor :name, :age

  def initialize(name, age)
    self.name = name
    self.age = age * DOG_YEARS
  end

  def to_s
    "This dog's name is #{name} and it is #{age} in dog years."
  end

end

spotty = GoodDog.new("Spotty", 4)
puts spotty # => This dog's name is Spotty and it is 28 in dog years.
# Voila!
