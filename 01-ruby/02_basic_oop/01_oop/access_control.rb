# Method Access Control

# Access to methods can be controlled with the modifiers
# public, private, protected

# A public methid is available to anyone who knows the class name or object name. 
# A private method does work in the class but is not available to the rest of the program.
# These are set by placing the keywords within a class.
# Everything below the keyword follows that modifier. 

class Dog
  DOG_YEARS = 7
  attr_accessor :name, :age
  def initialize(name, age)
    self.name = name
    self.age = age
  end

  def how_old
    "#{self.name} is #{human_years} in human years."
    # Here, we use the private method #human_years inside the class.
    # Note that self.human_years is not used, as this would attempt to 
    # access a private method. 
  end

  private

  def human_years
    age * DOG_YEARS
  end
end

spotty = Dog.new("Spotty", 4)
spotty.human_years # => NoMethodError: private method called...
# We can't access #human_years publicly. 
# Thus, #human_years must only be useful within the class itself.

# See above how #how_old uses #human_years, and it is publicly accessible. 
spotty.how_old # => "Spotty is 28 in human years."


# Protected methods are quite similar to private methods, 
# except that protected methods allow access between class instances, 
# while private methods do not allow this access. 

class Person
  def initialize(age)
    @age = age
  end

  def older?(other_person)
    age > other_person.age
  end

  protected 
  attr_reader :age

end

zac = Person.new(28)
olivia = Person.new(26)

zac.older?(olivia) # => true
olivia.older?(zac) # => false

olivia.age # => NoMethodError: protected method called...
# This is a similar error to calling a private method, 
# but the difference is that other instances of Person
# can still call it. e.g. the object zac can call #age from olivia.


# Overriding Methods

# Inherently, all classes created are subclasses of class Object. 
# This is built into Ruby and contains many important methods.

class Animal
  def speak(sound)
    "#{sound.capitalize}!"
  end
end

Animal.superclass # => Object

class Dog < Animal
  def speak
    "Dog says woof"
  end
end

Dog.superclass # => Animal

fufi = Dog.new
fufi.speak # => Dog says woof

# If a method is defined in a custom class that overrides a method
# in the Ruby Object class, programs may be negatively affected. 

# One example of this is Object#send. 

fufi.send :speak # => Dog says woof
# #send cannot be overwritten in user-defined subclasses without megative implications.

class Cat < Animal
  def speak 
    "Cat says meow"
  end

  def send
    "Send from Cat..."
  end
end

luna = Cat.new
luna.send :speak 
# Here, we would expect "Cat says meow" based on the default #send
# But we have overwritten #send. This code will now throw an error.
# => ArgumentError: wrong number of arguments in `send`

# Other Object methods
luna.instance_of? Cat # => true
luna.instance_of? Dog # => false
