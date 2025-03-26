# src: https://sandimetz.com/99bottles-sample-ruby

# We want to write a program to output the song 
# "99 Bottles of Beer" from a start point to an endpoint. 
# Here are four solutions and their pros & cons. 

# 1.1: Concise but Incomprehensible

class BottlesOne
  def song
    verses(99, 0)
  end

  def verses(hi, lo)
    hi.downto(lo).map do |n|
      verse(n)
    end.join("\n")
  end

  def verse(n)
    "#{ n == 0 ? 'No more' : n } bottle#{ 's' if n != 1 }" + 
    " of beer on the wall, " + 
    "#{ n == 0 ? 'No more' : n } bottle#{ 's' if n != 1 } of beer.\n" + 

    "#{ n > 0 ? "Take #{ n > 1 ? 'one' : 'it' } down, pass it around" 
    : 'Go to the store and buy some more'}, " + 
    "#{ n-1 < 0 ? 99 : n-1 == 0 ? 'no more' : n-1 } " + 
    "bottle#{ 's' if n-1 != 1 } of beer on the wall.\n"
  end
end
# This is extremely difficult to read through and comprehend.

# 1.2: General but Speculative

class BottlesTwo
  NoMore = lambda do |verse| 
    "No more bottles of beer on the wall, " + 
    "no more bottles of beer.\n" + 
    "Go to the store and buy some more, " + 
    "99 bottles of beer on the wall.\n"
  end

  LastOne = lambda do |verse| 
    "One more bottle of beer on the wall, " + 
    "one more bottle of beer.\n" + 
    "Take it down, pass it around, " + 
    "no more bottles of beer on the wall.\n"
  end

  Penultimate = lambda do |verse| 
    "2 bottles of beer on the wall, " + 
    "2 bottles of beer.\n" + 
    "Take one down, pass it around, " + 
    "One more bottle of beer on the wall.\n"
  end

  Default = lambda do |verse| 
    "#{verse.number} bottles of beer on the wall, " + 
    "#{verse.number} bottles of beer.\n" + 
    "Take one down, pass it around, " + 
    "#{verse.number - 1} bottles of beer on the wall.\n"
  end

  def song
    verses(99, 0)
  end

  def verses(hi, lo)
    hi.downto(lo).map do |verse_num| 
      verse(verse_number)
    end.join("\n")
  end

  def verse(num)
    verse_for(num).text
  end

  def verse_for(num)
    case num
      when 0 then Verse.new(num, &NoMore)
      when 1 then Verse.new(num, &LastOne)
      when 2 then Verse.new(num, &Penultimate)
      else Verse.new(num, &Default)
    end
  end

end

class Verse
  attr_reader :number
  def initialize(number, &lyrics)
    @number = number
    @lyrics = lyrics
  end

  def text
    @lyrics.call self
  end
end
# This one does a good job of exposing core concepts, 
# but a bad job of justifying its length and cost.

# 1.3: Concrete yet Abstract

class BottlesTre
  def song
    verses(99, 0)
  end

  def verses(hi, lo)
    hi.downto(lo).map do |bottles|
      verse(bottles)
    end.join("\n")
  end

  def verse(bottles)
    Round.new(bottles).to_s
  end
end

class Round 
  attr_reader :bottles
  def initialize(bottles)
    @bottles = bottles
  end

  def to_s
    "#{inventory} on the wall, #{inventory}.\n" + 
    "#{action}, #{inventory} on the wall."
  end

  def inventory
    "#{bottle_count} #{singular_plural} of #{drink}"
  end

  def drink
    "beer" 
  end

  def singular_plural
    last_one? ? "bottle" : "bottles"
  end

  def bottle_count
    all_out? ? "No more" : bottles.to_s
  end

  def action
    if all_out? 
      @bottles = 99 
      "Go to the store and buy some more"
    else
      @bottles -= 1
      "Take #{it_or_one} down, pass it around"
    end
  end

  def it_or_one
    last_one? ? 'it' : 'one'
  end

  def all_out?
    bottles.zero?
  end

  def last_one?
    bottles == 1
  end
end
# Small methods are usually good, but this does an awful job
# of conveying core ideas. 

# 1.4 "Shameless Green"

class Bottles 
  def song
    verses(99, 0)
  end

  def verses(hi, lo)
    hi.downto(lo).map do |num|
      verse(num)
    end.join("\n")
  end

  def verse(num)
    case num
    when 0 
      "No more bottles of beer on the wall, " + 
      "no more bottles of beer.\n" + 
      "Go to the store and buy some more, " + 
      "99 bottles of beer on the wall.\n"
    when 1
      "1 more bottle of beer on the wall, " + 
      "1 more bottle of beer.\n" + 
      "Take it down, pass it around, " + 
      "no more bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, " + 
      "2 bottles of beer.\n" + 
      "Take one down, pass it around, " + 
      "1 more bottle of beer on the wall.\n"
    else
      "#{num} bottles of beer on the wall, " + 
      "#{num} bottles of beer.\n" + 
      "Take one down, pass it around, " + 
      "#{num - 1} bottles of beer on the wall.\n"
    end
  end
end

# This is gratifyingly easy to understand. 
# There is some repetition of strings, but this is preferred
# to the other above methods where indirection causes confusion. 
