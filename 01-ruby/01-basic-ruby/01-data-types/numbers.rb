# Addition
1 + 1 #=> 2

# Subtraction
2 - 1 #=> 1

# Multiplication
2 * 2 #=> 4

# Division
10 / 5 #=> 2

# Exponent
2 ** 2 #=> 4
3 ** 4 #=> 81

# Modulus
8 % 2 #=> 0
10 % 4 #=> 2

# There are two types of numbers: integers and floats. 
# Operations between integers will *always* return integers. See below. 

17 / 5 #=> 3, not 3.4

# Floats are returned from operations done between at least one float. See below.

17 / 5.0 #=> 3.4, correctly.

# To convert an integer to a float:
13.to_f #=> 13.0

# To convert a float to an integer:
13.0.to_i #=> 13
13.9.to_i #=> 13
# The #to_i method does not round, it simply drops all decimal places.

# Some more useful number methods:

6.even? #=> true
7.even? #=> false

6.odd? #=> false
7.odd? #=> true

8.3.ceil #=> 9 (as an integer; not 9.0)
6.7.ceil #=> 7

8.3.floor #=> 8
6.7.floor #=> 6

8.3.round #=> 8(i)
6.7.round #=> 7(i)

6.abs #=> 6
-7.abs #=> 7

6.next #=> 7
-4.next #=> -3
8.3.next #=> error, only works on integers

6.pred #=> 5
-4.pred #=> -5
8.3.pred #=> error, again only works on integers
