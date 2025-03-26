# RuboCop

# RuboCop is an add-on that checks Ruby code for inconsistencies
# against the community Style Guides. 

# "This Ruby style guide recommends best practices so that real-world Ruby programmers
# can write code that can be maintained by other real-world Ruby programmers.
# A style guide that reflects real-world usage gets used,
# while a style guide that holds to an ideal that has been rejected
# by the people it is supposed to help risks not getting used at all - no matter how good it is.

# "The guidelines provided here are intended to improve the readability of code
# and make it consistent across the wide spectrum of Ruby code."


# RuboCop has multiple "precincts" because of course it does. 

# Style Cops check for stylistic consistency of your code. Many of the them are based on the Ruby Style Guide.
# Lint Cops check for ambiguities and possible errors in your code.
# Metrics Cops deal with properties of the source code that can be measured, such as class length, method length, etc.

gem install rubocop
cd ../odin-basic-ruby-methods
bundle init
bundle add rubocop
bundle exec rubocop

# Jesus, that's a lot of offenses. 243 to be exact...

# RuboCop provides various types of issues: 
# C is for convention, i.e. standard Ruby convention has been broken. 
# W is for warning.
# F is for fatal.

# To have RuboCop automatically correct certain errors: 
bundle exec rubocop -a 
# Where the -a flag indicates autocorrect.
# The flag -A can also be used to force all [Correctable] offenses to be fixed, 
# not just the "safe" ones. 


# Additional Departments
gem install rubocop-performance
# This is an additional dept in rubocop that should generally be included in bundles
# but *not* necessarily required. This is achieved like so: 

# Gemfile
gem 'rubocop-performance', require: false

# Next, rubocop must load the new extension. 
# This requires a .rubocop.yml file, which can be initialized with
bundle exec rubocop --init
# Then add the following line to the .yml file:
require: rubocop-performance

# Now, RuboCop will know to use the extension whenever `bundle exec rubocop` is run.

### For more information on how to tailor RuboCop to specific needs, see
# https://www.theodinproject.com/lessons/ruby-linting-and-rubocop#power-corrupts

# A global rubocop yml file can be stored in ~/
# and properties of project rubocop yml files can inherit behaviors from global. 
inherit_from: ~/.rubocop.yml
