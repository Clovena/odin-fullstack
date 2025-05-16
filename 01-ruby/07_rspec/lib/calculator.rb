# frozen_string_literal: true

# Calculator class
class Calculator
  def add(*nums)
    nums.reduce do |sum, n|
      sum + n
    end
  end

  def multiply(*nums)
    nums.reduce(1) do |product, n|
      product * n
    end
  end
end
