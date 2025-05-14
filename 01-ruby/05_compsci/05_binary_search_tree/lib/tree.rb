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
    return if arr.empty?

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
  def depth(search, node = @root, level = 0)
    return if node.nil?
    return level if search == node.value

    level += 1
    if search < node.value
      depth(search, node.left, level)
    else
      depth(search, node.right, level)
    end
  end

  def max_depth(arr = @array)
    return 0 if arr.nil?

    Math.log2(arr.size).floor
  end

  def height(search, node = @root, level = max_depth)
    return if node.nil?
    return level if search == node.value

    level -= 1
    if search < node.value
      height(search, node.left, level)
    else
      height(search, node.right, level)
    end
  end

  def balanced?(node = @root, result = [])
    return if node.nil?

    height_left = max_depth(preorder(node.left))
    height_right = max_depth(preorder(node.right))
    result << ((height_left - height_right).abs <= 1)

    balanced?(node.left, result) if node.left
    balanced?(node.right, result) if node.right

    result.all?
  end

  def find(search, node = @root)
    return if node.nil?

    return node if search == node.value

    find(search, node.left) if search < node.value
    find(search, node.right) if search > node.value
  end

  def find_parent(search, node = @root)
    return if node.nil? || search == node.value
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
        node.left = node.left.children[0]
      elsif node.left.num_children == 2
        inorder_delete(node.left)
      end
    elsif node.right && search == node.right.value
      if node.right.num_children.zero?
        node.right = nil
      elsif node.right.num_children == 1
        node.right = node.right.children[0]
      elsif node.right.num_children == 2
        inorder_delete(node.right)
      end
    end
  end

  def inorder_delete(node)
    # Consider checking if depth is exactly one less than
    # max depth. In this case, no need to go to the right first;
    # the replace_value should simply be the leftmost
    # (not the leftmost of the right child).
    # May be able to implement after developing #depth.
    replace_value = node.inorder_successor.value
    delete(replace_value)
    node.value = replace_value
  end

  # Breadth-first traversal
  def level_order
    return if @root.nil?

    queue = [@root]
    result = []
    until queue.empty?
      node = queue.shift
      block_given? ? yield(node) : result << node.value
      queue.push(node.left) if node.left
      queue.push(node.right) if node.right
    end
    result unless block_given?
  end

  # Depth-first traversal
  def preorder(node = @root, result = [], &block)
    return if node.nil?

    result << node.value
    yield(node) if block_given?

    preorder(node.left, result, &block) if node.left
    preorder(node.right, result, &block) if node.right

    result if node == @root && !block_given?
  end

  def inorder(node = @root, result = [], &block)
    return if node.nil?

    inorder(node.left, result, &block) if node.left

    result << node.value
    yield(node) if block_given?

    inorder(node.right, result, &block) if node.right

    result if node == @root && !block_given?
  end

  def postorder(node = @root, result = [], &block)
    return if node.nil?

    postorder(node.left, result, &block) if node.left
    postorder(node.right, result, &block) if node.right

    result << node.value
    yield(node) if block_given?

    result if node == @root && !block_given?
  end
end
