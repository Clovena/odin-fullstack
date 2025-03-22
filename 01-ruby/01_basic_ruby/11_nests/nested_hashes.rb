# Nested Hashes

vehicles = {
  zac: {year: 2017, make: "Honda", model: "HR-V"},
  liv: {year: 2006, make: "Subaru", model: "Outback"},
  izzi: {year: 2024, make: "Subaru", model: "Forester"},
}

# Accessing elements in nested hashes

vehicles[:zac][:make] # => "Honda"
vehicles[:liv][:year] # => 2006

vehicles[:zac][:color] # => nil; :zac exists, :color does not
vehicles[:josh][:model] # => NoMethodError
vehicles.dig(:josh, :model) # => nil


# Adding and removing elements

vehicles[:josh] = {
  year: 2014,
  make: "Hyundai",
  model: "Kona",
}
vehicles[:zac][:color] = "black"

vehicles.delete(:izzi)
vehicles[:zac].delete(:color)


# Methods on nested hashes

vehicles = {
  zac: {year: 2017, make: "Honda", model: "HR-V"},
  liv: {year: 2006, make: "Subaru", model: "Outback"},
  izzi: {year: 2024, make: "Subaru", model: "Forester"},
}

# For the entire k-v pairs:
vehicles.select do |name, data|
  data[:year] >= 2020
end
# => {izzi: {year: 2024, make: "Subaru", model: "Forester"} }

# For just the keys:
vehicles.collect do |name, data|
  if data[:year] > 2010
    name
  end
end
# => [:zac, nil, :izzi]

# To trim nils after #collect is used: 
vehicles.collect { |k, v| name if data[:year] > 2010 }.compact
# => [:zac, :izzi]

# One method to combine these two: #filter_map
vehicles.filter_map do |k, v| 
  name if data[:year] > 2010
end
# => [:zac, :izzi]
