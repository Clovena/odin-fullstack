# src: http://ruby.bastardsbook.com/chapters/numbers/

# 1. Predict the output of each.

12 - 1 * 4 #=> 8; order of operations is observed
-40 * -20 #=> +800
4.2.to_i * 5 #=> 20
10 + 1.to_f #=> 11.0(f)
14 % 4 #=> 2
1 % 100 #=> 1
6 % 3 #=> 0
3 ** 8 / 4.to_f #=> 1640.25
3 ** 8 / 4.to_i #=> 1640
(3 ** 8 / 4.to_i).to_f #=> 1640.0
20.9.to_i / 15 % 3 #=> 1


# src: http://ruby-for-beginners.rubymonstas.org/exercises/numbers.html

# 1. In irb, calculate:
# How many hours are in a year.
# How many minutes are in a decade.
# How many seconds old you are.

hours_in_year = 365 * 24
minutes_in_decade = 10 * 365 * 24 * 60
age = (27 + (10 / 12.to_f)) # as of March 01, 2025, 3:26a
age_in_seconds = age * 365 * 24 * 60 * 60

puts hours_in_year
puts minutes_in_decade
puts age_in_seconds.to_i

# 2. Predict the output of each
3.0 / 2 #=> 1.5
3 / 2.0  #=> 1.5
4 ** 2.0 #=> 16.0
4.1 % 2 #=> 0.1
