# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

require_relative 'bst_node'

class BinarySearchTree

  def initialize
    @root = nil
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
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])

    print tree_node.value

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
