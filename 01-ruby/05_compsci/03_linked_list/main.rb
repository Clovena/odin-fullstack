# frozen_string_literal: true

require_relative 'lib/linked_list'

list = LinkedList.new

list.append('dog')
list.append('cat')
list.prepend('unicorn')
list.append('turtle')

puts 'Here is the whole list:'
puts list
puts
puts 'Insert mid-list:'
list.insert_at('pony', 2)
puts list
puts
puts 'Remove mid-list:'
list.remove_at(3)
puts list
