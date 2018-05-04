class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    @prc = prc || Proc.new { |el1, el2| el1 <=> el2 }
  end

  def count
    store.length
  end

  def extract
    raise "no element to extract" if count == 0

    val = store[0]
    if self.count > 1
      store[0] = store.pop
      BinaryMinHeap.heapify_down(store, 0, &prc)
    else
      store.pop
    end

    val
  end

  def peek
    raise "no element to peek" if count == 0
    store[0]
  end

  def push(val)
    store.push(val)
    BinaryMinHeap.heapify_up(store, self.count - 1, &prc)
  end

  public
  def self.child_indices(len, parent_index)
    left_child = 2 * parent_index + 1
    right_child = 2 * parent_index + 2

    [left_child, right_child].select do |idx|
      idx < len
    end
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0

    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    children = BinaryMinHeap.child_indices(len, parent_idx)
    return array if children.length == 0
    return array if children.all? { |child| prc.call(array[child], array[parent_idx]) >= 0 }

    # find smaller child's index
    smaller_child_idx = children[0]
    if children.length > 1
      right_child_idx = children[1]
      if prc.call(array[right_child_idx], array[smaller_child_idx]) != 1
        smaller_child_idx = right_child_idx
      end
    end

    # swap parent with child if parent is larger
    temp_node = array[smaller_child_idx]
    array[smaller_child_idx] = array[parent_idx]
    array[parent_idx] = temp_node

    BinaryMinHeap.heapify_down(array, smaller_child_idx, array.length, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    return array if child_idx == 0

    parent_idx = BinaryMinHeap.parent_index(child_idx)
    if (prc.call(array[child_idx], array[parent_idx]) != 1)
      temp_node = array[child_idx]
      array[child_idx] = array[parent_idx]
      array[parent_idx] = temp_node
      BinaryMinHeap.heapify_up(array, parent_idx, len, &prc)
    else
      return array
    end
  end
end
