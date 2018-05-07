require_relative 'binary_search_tree'

def kth_largest(tree_node, k)
  array = in_order_traversal(tree_node)

  if array.length >= k
    array[-k]
  else
    nil
  end
end

def in_order_traversal(tree_node, arr = [])
  return [tree_node] unless tree_node.children

  left_child_sub = tree_node.left_child
  right_child_sub = tree_node.right_child
  left_child_arr = []
  right_child_arr = []

  left_child_arr.concat(in_order_traversal(left_child_sub)) if left_child_sub
  right_child_arr.concat(in_order_traversal(right_child_sub)) if right_child_sub

  left_child_arr + [tree_node] + right_child_arr
end

def maximum(tree_node)
  return tree_node unless tree_node.right_child

  maximum(tree_node.right_child)
end
