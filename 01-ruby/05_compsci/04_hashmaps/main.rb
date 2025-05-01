# frozen_string_literal: true

require_relative 'lib/hashmap'

hashmap = Hashmap.new

hashmap.set(:apple, 'red')
hashmap.set(:strawberry, 'red')
hashmap.set(:orange, 'orange')
hashmap.set(:mango, 'orange')
hashmap.set(:banana, 'yellow')
hashmap.set(:lemon, 'yellow')
hashmap.set(:grapes, 'green')
hashmap.set(:lime, 'green')
hashmap.set(:kiwi, 'green')
hashmap.set(:blueberry, 'blue')
hashmap.set(:peach, 'pink')
hashmap.set(:plum, 'purple')
hashmap.set(:grapes, 'purple')
hashmap.set(:elderberry, 'violet')
hashmap.set(:blackberry, 'black')

p hashmap.keys
