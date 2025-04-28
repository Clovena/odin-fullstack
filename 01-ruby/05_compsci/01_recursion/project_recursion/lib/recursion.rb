# frozen_string_literal: true

# Recursive methods in TOP assignment
module Recursion
  def self.fibonacci(num)
    return num if num <= 1

    fibonacci(num - 1) + fibonacci(num - 2)
  end

  def self.merge_sort(arr)
    return arr if arr.length <= 1

    a = merge_sort(arr.slice!(0, arr.length / 2))
    b = merge_sort(arr)
    new = []
    new << (a.first <= b.first ? a.shift : b.shift) until a.empty? || b.empty?
    new + a + b
  end
end
