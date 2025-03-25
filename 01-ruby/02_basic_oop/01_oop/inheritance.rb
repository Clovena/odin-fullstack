# OOP Inheritance
# Defined as the process of a class receiving behavior from another class.

class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
end

class KittyCat < Animal
end

# Here, Animal is the superclass.
# GoodDog and KittyCat are subclasses, inheriting behavior from Animal.
# The inheritance is explicit, denoted by the <

spotty = GoodDog.new
havana = KittyCat.new
spotty.speak # => Hello!
havana.speak # => Hello!

# Methods can be overwritten within subclasses: 

class GoodDog < Animal
  def speak
    "Dog says woof!"
  end
end

fufi = GoodDog.new
luna = KittyCat.new
fufi.speak # => Dog says woof!
luna.speak # => Hello!

# If the superclass is to be called directly within a subclass method:
# Use the keyword super

class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  def speak
    super + "from GoodDog class"
    # Here, `super` invokes #speak from Animal, then appends additional content
  end
end

fufi = GoodDog.new
luna = KittyCat.new
fufi.speak # => Hello! from GoodDog class
luna.speak # => Hello!

# If the superclass has an initialize method:

class Animal
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

spotty = GoodDog.new("brown")
# This will set @name and @color to "brown"
# So how do we access @name within the superclass?

class GoodDog < Animal
  def initialize(name, color) # We create a parameter in #initialize, and
    super(name) # We add a parameter to the super call. 
    @color = color
  end
end

fufi = GoodDog.new("Fufi", "brown")

# In cases where super should be called but requires no arguments, 
# it is better practice to call with explicitly no arguments initialize()

class Animal
  def initialize
  end
end

class KittyCat < Animal
  CAT_YEARS = 4
  def initialize(name, age)
    super()
    @name = name
    @age = age * CAT_YEARS
  end
end

havana = KittyCat.new("Havana", 4)
# @name will equal Havana and @age will equal 16


# Mixing In Modules

# Consider a hierarchy with the supermost class Animal, 
# with two subclasses Mammal and Fish, 
# and with further Mammal subclasses Cat and Dog.
# Now consider a method #swim, which should belong to Fish and Dog
# but not Cat. 

# This method should not be in Animal, since not all Animal objects swim. 
# Neither should this be in Mammal, since non-Mammal objects swim. 
# Therefore, we *mix* in a module which contains #swim. 

module Swimmable
# Common Ruby convention is to name modules with "-able" 
# to describe the behavior that the module is modeling.
  def swim
    "I can swim!"
  end
end

class Animaol
end

class Fish < Animal
  include Swimmable # here is where the mixing occurs
end

class Mammal < Animal
end

class Cat < Mammal
# note that inheriting from Mammal necessarily
# causes inheritance from Animal as well.
end

class Dog < Mammal
  include Swimmable # again, we are mixing in a module here.
end

fufi = Dog.new
luna = Cat.new
ufishies = Fish.new

fufi.swim # => I can swim!
ufishies.swim # => I can swim!
luna.swim # => NoMethodError


# Module Namespacing 

# The process of organizing similar classes under a module.
# Consider the Mammal example from earlier. 
# This can be transformed into a module which contains
# all related classes. 

module Mammal

  class Dog
    def speak
      "Woof"
    end
  end

  class Cat
    def purr
      "(purrs)"
    end
  end

end

# Then, to call a Dog or Cat class: 
spotty = Mammal::Dog.new
havana = Mammal::Cat.new
spotty.speak # => Woof
havana.purr  # => (purrs)

# Module Containing

# In addition to collecting classes within a module, 
# another popular use case is to contain a group of methods.
# These are called module methods. 
# One built-in container module in Ruby is Math.

module Conversions
  def self.fahrenheit_to_celsius(num)
    (num - 32) * 5 / 9
  end
end

# These methods are simply called with a dot:
temp = Conversions.fahrenheit_to_celsius(32)
# => 0