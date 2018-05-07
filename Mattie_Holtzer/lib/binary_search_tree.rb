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
  end

  def delete(value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:

  def is_leaf?(node)
    !!node.left_val && !!node.right_val
  end

  def left_val(node)
    node.left.value
  end

  def right_val(node)
    node.right.value
  end

end
