# frozen_string_literal: true

# Methods for class Tree
class Tree
  attr_accessor :array, :root

  # Initialization methods
  def initialize(arr)
    @array = arr.uniq.sort
    @root = build_tree(array)
  end

  def build_tree(arr)
    return nil if arr.empty?

    midpt = (arr.size - 1) / 2
    # midpt = arr.size / 2
    root = Node.new(arr[midpt])

    root.left = build_tree(arr[0...midpt])
    root.right = build_tree(arr[(midpt + 1)..])
    root
  end

  # Overwriting to_s using Discord pretty_print
  def to_s(node = @root, prefix = '', is_left = true) # rubocop:disable Style/OptionalBooleanParameter
    to_s(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    to_s(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  # Tree and node metadata
  def lowest?(node)
    node.left.nil? && node.right.nil?
  end

  # Manipulate nodes
  def insert(value, node = @root)
    if value < node.value
      node.left.nil? ? add_node(value) : insert(value, node.left)
    elsif value > node.value
      node.right.nil? ? add_node(value) : insert(value, node.right)
    end
  end

  def add_node(value)
    "#{value} added here." # WIP
  end
end
