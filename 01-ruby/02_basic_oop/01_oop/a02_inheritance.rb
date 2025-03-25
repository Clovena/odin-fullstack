# src: https://launchschool.com/books/oo_ruby/read/inheritance#exercises

# 1. Create a superclass called Vehicle for your MyCar class to inherit from
# and move the behavior that isn't specific to the MyCar class to the superclass.
# Create a constant in your MyCar class that stores information about the vehicle
# that makes it different from other types of Vehicles.

# 2. Add a class variable to your superclass that can keep track of
# the number of objects created that inherit from the superclass.
# Create a method to print out the value of this class variable as well.

# 3. Create a module that you can mix in to ONE of your subclasses
# that describes a behavior unique to that subclass.

module Towable #3
  def can_tow?(weight)
    weight <= 2000
  end
end

class Vehicle
  @@vehicle_count = 0 #2
  attr_accessor :model, :make, :year, :color, :speed

  def initialize(model, make, year, color)
    self.model = model
    self.make = make
    self.year = year
    self.color = color
    self.speed = 0
    @@vehicle_count += 1 #2
  end

  def num_vehicles #2
    "This program has createed #{@@vehicle_count} vehicles."
  end

  def mpg(max_miles, tank_volume)
    mpg = (max_miles / tank_volume.to_f).round
    puts "This vehicle gets #{mpg} miles per gallon."
    mpg
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

class MyCar < Vehicle
  NUM_DOORS = 4
  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end
end

class MyTruck < Vehicle
  include Towable #3
  NUM_DOORS = 2
  attr_accessor :rims

  def initialize
    super()
    self.rims = false
  end

  def add_rims
    self.rims = true
    puts "Nice new rims!"
  end
end
