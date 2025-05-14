# frozen_string_literal: true

require_relative 'node'

# Methods for class Tree
class Tree
  attr_accessor :array, :root

  # Initialization methods
  def initialize(arr)
    @array = arr.uniq.sort
    @root = build_tree(@array)
  end

  def build_tree(arr)
    return nil if arr.empty?

    midpt = (arr.size - 1) / 2
    root = Node.new(arr[midpt])
    root.left = build_tree(arr[0...midpt])
    root.right = build_tree(arr[(midpt + 1)..])
    root
  end

  def rebalance!
    @root = build_tree(@array.uniq.sort)
  end

  # Overwriting to_s using Discord pretty_print
  def to_s(node = @root, prefix = '', is_left = true) # rubocop:disable Style/OptionalBooleanParameter
    to_s(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    to_s(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  # Tree/node metadata & interaction
  def find(search, node = @root)
    return nil if node.nil?

    return node if search == node.value

    find(search, node.left) if search < node.value
    find(search, node.right) if search > node.value
  end

  def find_parent(search, node = @root)
    return nil if node.nil? || search == node.value
    return node if child_match?(search, node)

    if search < node.value
      find_parent(search, node.left)
    else
      find_parent(search, node.right)
    end
  end

  def child_match?(search, node = @root)
    return true if node.left && search == node.left.value
    return true if node.right && search == node.right.value

    false
  end

  # Insert new nodes
  def insert(value, node = @root)
    if value < node.value
      node.left.nil? ? node.left = add_node(value) : insert(value, node.left)
    elsif value > node.value
      node.right.nil? ? node.right = add_node(value) : insert(value, node.right)
    end
  end

  def add_node(value)
    @array << value
    Node.new(value)
  end

  # Remove existing nodes
  def delete(search)
    parent = find_parent(search)
    return if parent.nil?

    select_deletion(search, parent)
  end

  def select_deletion(search, node)
    # WIP: Still could be trimmed down.
    # Running into problems when trying to modularize
    # conditions of zero and one child.

    if node.left && search == node.left.value
      if node.left.num_children.zero?
        node.left = nil
      elsif node.left.num_children == 1
        node.left = node.left.child
      elsif node.left.num_children == 2
        inorder_delete(node.left)
      end
    elsif node.right && search == node.right.value
      if node.right.num_children.zero?
        node.right = nil
      elsif node.right.num_children == 1
        node.right = node.right.child
      elsif node.right.num_children == 2
        inorder_delete(node.right)
      end
    end
  end

  def inorder_delete(node)
    replace_value = node.inorder_successor.value
    delete(replace_value)
    node.value = replace_value
  end
end
