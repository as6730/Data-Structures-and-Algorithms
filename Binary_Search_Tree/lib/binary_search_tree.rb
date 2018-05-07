# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end


  def insert(val)
    new_node = BSTNode.new(val)
    if @root.nil?
      @root = new_node
    else
      append(new_node)
    end

  end


  def find(val, tree_node = @root)
    case val <=> tree_node.val
    when 0
      tree_node
    when -1
      return nil unless tree_node.left_child
      find(val, tree_node.left_child)
    else
      return nil unless tree_node.right_child
      find(val, tree_node.right_child)
    end
  end


  def delete(val)
    target = find(val)
    parent = target.parent

    if target.children.length == 0
      return @root = nil if parent.nil?
      target.less_than?(parent) ? parent.left_child = nil : parent.right_child = nil
    elsif target.children.length == 1
      target.children[0].append_to(parent)
    elsif target.children.length == 2
      replacement = maximum(target.left_child)
      replacement.left_child.append_to(replacement.parent)
      replacement.replace(target)
    end
  end


  def maximum(tree_node = @root)
    return tree_node unless tree_node.right_child

    maximum(tree_node.right_child)
  end


  def depth(tree_node = @root)
    return 0 unless tree_node
    return 0 if tree_node.children.empty?

    depths = [depth(tree_node.left_child), depth(tree_node.right_child)]
    max_depth = depths.max

    max_depth + 1
  end


  def is_balanced?(tree_node = @root)
    return true if depth(tree_node) < 2

    left_child = tree_node.left_child
    right_child = tree_node.right_child

    return false if (depth(left_child) - depth(right_child)).abs > 1

    self.is_balanced?(left_child) && is_balanced?(right_child)
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return [tree_node.val] unless tree_node.children

    left_child_temp = tree_node.left_child
    right_child_child_temp = tree_node.right_child
    left_child_arr = []
    right_child_child_arr = []

    left_child_arr.concat(self.in_order_traversal(left_child_temp)) if left_child_temp
    right_child_child_arr.concat(self.in_order_traversal(right_child_child_temp)) if right_child_child_temp

    left_child_arr + [tree_node.val] + right_child_child_arr
  end


  private
  def append(new_node, current_node = @root)
    if new_node.less_than?(current_node)
      if current_node.left_child
        append(new_node, current_node.left_child)
      else
        new_node.append_to(current_node)
      end
    else
      if current_node.right_child
        append(new_node, current_node.right_child)
      else
        new_node.append_to(current_node)
      end
    end
  end
end
