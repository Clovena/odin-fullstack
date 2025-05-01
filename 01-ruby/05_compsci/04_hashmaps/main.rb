# frozen_string_literal: true

require_relative 'lib/hashmap'

hashmap = Hashmap.new

hashmap.set(:a, 'red')
hashmap.set(:i, 'purple')
hashmap.set(:q, 'yellow')
hashmap.set(:y, 'green')
hashmap.set(:q, 'orange')

puts hashmap
