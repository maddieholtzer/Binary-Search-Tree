require_relative 'binary_search_tree'

def kth_largest(tree_node, k)
  counter = 0
  bst = BinarySearchTree.new(tree_node)
  node = tree_node
  while counter < k-1
    bst.delete(bst.maximum(bst.root).value)
    counter+=1
    print bst.maximum(bst.root).value
  end
  bst.maximum(bst.root)
end
