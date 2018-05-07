class BSTNode
  attr_reader :val
  attr_accessor :left_child, :right_child, :parent, :depth

  def initialize(val)
    @val = val
    @parent = nil
    @left_child = nil
    @right_child = nil
  end

  def less_than?(other_node)
    val <= other_node.val
  end

  def children
    children = []
    children << @left_child if @left_child
    children << @right_child if @right_child

    children
  end

  def siblings?
    @parent.children.length == 2
  end

  def append_to(parent)
    @parent = parent
    if self.less_than?(parent)
      parent.left_child = self
    else
      parent.right_child = self
    end

    val
  end

  def replace(deleted_node)
    @parent = deleted_node.parent
    @left_child = deleted_node.left_child
    @right_child = deleted_node.right_child

    @parent.left_child = self
  end

end
