# Ruby Gems

# Gems are packages of Ruby libraries that someone wrote and published. 
# Similar to R packages. 

require 'colorize'
# Here, colorize represents a gem. 
# This must be installed using the command
# `gem install colorize`

puts 'Red goes faster!'.colorize(:red)
puts "I'm blue da ba dee da ba di!".colorize(:blue)
puts "It ain't easy bein' green...".colorize(:green)

# Bundler

# To ensure users are keeping consistent with many many gems
# and many versions of gems, Bundler is used.
# This allows a user to declare what gems a project needs, including version.
# Other users can take this bundle, called a Gemfile, 
# and quickly install it via `bundle install`

# A project can be initialized with a bundle via:
# `bundle init` in the parent directory
# `bundle add [gem]` to add gems to Gemfile


# .ruby-version

# This is an important file to include in projects
# as it gives other users a declared version of Ruby to use.

# `rbenv versions` can be called to see local versions, and then
# `rbenv local [v.v.v]` creates the .ruby-version file.