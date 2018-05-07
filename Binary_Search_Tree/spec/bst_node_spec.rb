require 'rspec'
require 'bst_node'

describe BSTNode do
  let(:bst_node) { BSTNode.new(5) }

  it "takes in a val in the constructor and defines it as an attr_reader" do
    expect(bst_node.val).to eq(5)
  end

  it "sets #left_child and #right_child as attr_accesors" do
    bst_node.left_child = BSTNode.new(2)
    expect(bst_node.left_child.val).to eq(2)

    bst_node.right_child = BSTNode.new(7)
    expect(bst_node.right_child.val).to eq(7)
  end

end
