# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

require_relative 'bst_node'

class BinarySearchTree

  def initialize(root = nil)
    @root = root
  end

  def insert(value)
    if @root.nil?
      @root = BSTNode.new(value)
      return
    end
    current = @root
    while true
      if current.value>value
        if current.left.nil?
          current.left = BSTNode.new(value)
          return
        end
        current = current.left
      else
        if current.right.nil?
          current.right = BSTNode.new(value)
          return
        end
        current = current.right
      end
    end
  end

  def root
    @root
  end

  def find(value, tree_node = @root)
    current = tree_node
    until current.nil? || current.value == value
      if current.value>value
        current = current.left
      else
        current = current.right
      end
    end
    current
  end

  def delete(value)
    current = @root
    prev_node = current
    last_change = ""
    until current.nil? || current.value == value
      if current.value>value
        prev_node = current
        current = current.left
        last_change = "left"
      elsif current.value<value
        prev_node = current
        current = current.right
        last_change = "right"
      end
    end
    if is_leaf?(current)
      if current == @root
        @root = nil
      elsif last_change == "left"
        prev_node.left = nil
      else
        prev_node.right = nil
      end
    elsif (current.left && !current.right) || (!current.left && current.right)
      left = current.left
      right = current.right
      if current == @root
        @root = nil
        if !!left
          @root = left
        else
          @root = right
        end
      elsif last_change == "left"
        if !!left
          prev_node.left = left
        else
          prev_node.left = right
        end
      else
        if !!left
          prev_node.right = left
        else
          prev_node.right = right
        end
      end
    else
      if current == @root
        @root = nil
      elsif last_change == "left"
        max = maximum(current.left)
        if max.left
          prev_node.left.left.right = max.left
        end
        prev_node.left = max
      else
        max = maximum(current.left)
        prev_node.right = max
      end
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    current = tree_node
    until current.right.nil?
      current = current.right
    end
    current
  end

  def depth(tree_node = @root)
    return 0 if tree_node.nil? || is_leaf?(tree_node)
    left = 0
    right = 0
    if !tree_node.left.nil?
      left = 1 + depth(tree_node.left)
    end

    if !tree_node.right.nil?
      right = 1 + depth(tree_node.right)
    end

    [left, right].max
  end

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil? || is_leaf?(tree_node)
    left = depth(tree_node.left)
    right = depth(tree_node.right)
    return false if (left-right).abs >1
    is_balanced?(tree_node.right) && is_balanced?(tree_node.left)
  end

  def in_order_traversal(tree_node = @root, arr = [])

    return [] if tree_node.value.nil?
    return [tree_node.value] if is_leaf?(tree_node)

    left = []
    right = []

    if !tree_node.left.nil?
      left = in_order_traversal(tree_node.left)
    end

    if !tree_node.right.nil?
      right = in_order_traversal(tree_node.right)
    end

    left + [tree_node.value] + right

  end


  private
  # optional helper methods go here:

  def is_leaf?(node)
    !node.left && !node.right
  end

  def left_val(node)
    node.left.value
  end

  def right_val(node)
    node.right.value
  end

end
