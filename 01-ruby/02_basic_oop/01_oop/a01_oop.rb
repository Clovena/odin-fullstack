# src: https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1#exercises

# 1a. Create a class called MyCar.
# When you initialize a new instance or object of the class,
# allow the user to define some instance variables that define
# the year, color, and model of the car.

# 1b. Create an instance variable that is set to 0 during instantiation
# to track the current speed of the car as well.
# Create instance methods that allow the car to speed up, brake,
# and shut the car off.

# 2. Add an accessor method to your MyCar class
# to change and view the color of your car.
# Then add an accessor method that allows you to view,
# but not modify, the year of your car.

# 3. You want to create a nice interface that allows you to
# accurately describe the action you want your program to perform.
# Create a method called spray_paint that can be called on an object
# and will modify the color of the car.

class MyCar
  attr_accessor :color, :model, :speed
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    self.color = color
    self.model = model
    self.speed = 0
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  def speed_up(by)
    self.speed += by
  end

  def slow_down(by)
    self.speed -= by
  end

  def shut_off
    self.speed = 0
  end

end

honda = MyCar.new(2017, "black", "honda")
honda.speed_up(30) # => 30
honda.speed # => 30
honda.slow_down(10) # => 20
honda.shut_off # => 0
honda.spray_paint("red") # => Your new red paint job looks great!