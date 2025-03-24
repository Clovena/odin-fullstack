# src: https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1#exercises
# src: https://launchschool.com/books/oo_ruby/read/classes_and_objects_part2#exercises

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

# 4. Add a class method to your MyCar class
# that calculates the gas mileage (i.e. miles per gallon) of any car.

# 5. Override the to_s method to create a user friendly print out of your object.

class MyCar
  # 2. 
  attr_accessor :color, :model, :speed
  attr_reader :year

  # 1a.
  def initialize(year, color, model)
    @year = year
    self.color = color
    self.model = model
    # 1b.
    self.speed = 0
  end
  
  # 5.
  def to_s
    "This car is a #{year} #{model.capitalize} with #{color} paint."
  end
  
  # 1b.
  def speed_up(by)
    self.speed += by
  end
  # 1b.
  def slow_down(by)
    self.speed -= by
  end
  # 1b.
  def shut_off
    self.speed = 0
  end
  
  # 3. 
  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  # 4. 
  def mpg(max_miles, tank_volume)
    mpg = (max_miles / tank_volume.to_f).round
    puts "This car gets #{mpg} miles per gallon."
    mpg
  end

end

honda = MyCar.new(2017, "black", "honda")

honda.speed_up(30) # => 30
honda.speed # => 30
honda.slow_down(10) # => 20
honda.shut_off # => 0

honda.spray_paint("red") # => Your new red paint job looks great!

honda.mpg(330, 12)
# This car gets 28 miles per gallon.
# => 28

puts honda 
# This car is a 2017 Honda with black paint.
# => nil