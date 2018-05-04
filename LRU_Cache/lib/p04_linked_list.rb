class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    @next.prev = @prev
    @prev.next = @next
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    j = 0

    self.each do |node|
      return node if i == j
      j += 1
    end

    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @tail.prev == @head
  end

  def get(key)
    curr_node = @head
    counter = 0

    while curr_node != @tail
      return curr_node.val if curr_node.key == key
      counter += 1
      curr_node = curr_node.next
    end
  end

  def include?(key)
    self.each do |node|
      return true if node.key == key
    end

    false
  end

  def append(key, val)
    new_node = Node.new(key, val)

    new_node.prev = @tail.prev
    @tail.prev.next = new_node
    @tail.prev = new_node
    new_node.next = @tail

    new_node
  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
        return node
      end
    end
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        node.remove
        return
      end
    end
  end

  def each
    curr_node = @head.next

    until curr_node == @tail
      yield curr_node
      curr_node = curr_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
