# src: https://zetcode.com/lang/rubytutorial/oop/

# simple.rb

class Being
end

b = Being.new
puts b

# constructor.rb

class Being
  def initialize
    puts "Being is created"
  end
end

Being.new

# person.rb

class Person 
  def initialize(name)
    @name = name
  end

  def get_name
    @name
  end
end

person1 = Person.new("Zac")
person2 = Person.new("Liv")

puts person1.get_name # => Zac
puts person2.get_name # => Liv

# constructor_overload.rb

class Person
  def initialize(name = "unknown", age = 0)
    @name = name
    @age = age
  end

  def to_s
    "Name: #{@name}; Age: #{@age}"
  end
end

person1 = Person.new
puts person1 # => Name: unknown; Age: 0
person2 = Person.new("Zac", 28)
puts person2 # => Name: Zac; Age: 28

# call_method.rb

class Person
  def initalize name # This syntax, sans parentheses, is also accepted in Ruby.
    @name = name 
  end
  def get_name # This is our call method.
    @name
  end
end

zac = Person.new "Zac" # again, check out this non-parenthesis syntax
puts zac.get_name # => Zac

class Circle
  @@PI = 3.141592653589793 # Here we see a class variable explicitly defined.

  def initialize 
    @radius = 0
  end

  def set_radius(radius)
    @radius = radius
  end

  def area
    @radius * @radius * @@PI
  end

end

c = Circle.new
c.set_radius(5)
c.area # => 78.5398

# private_methods.rb

# Private methods can be called only inside a class definition
# and *without* the self keyword.

class Some
  def initialize
    method1
  end

  private

  def method1
    puts "Private method1 called."
  end

end

s = Some.new
s.method1 # => NoMethodError

# inheritance.rb

class Being
  def initialize
    puts "Being created."
  end
end

class Human < Being
  def initialize
    super()
    puts "Being is a Human."
  end
end

Being.new # Being created.
Human.new # Being created. Being is a Human.
