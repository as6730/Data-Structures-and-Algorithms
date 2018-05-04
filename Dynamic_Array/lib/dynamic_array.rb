require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    self.capacity = 8
    self.length = 0
    self.store = StaticArray.new(8)
  end

  # O(1)
  def [](index)
    check_index(index)
    store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" unless self.length > 0

    val = self[length - 1]
    self[length - 1] = nil
    self.length -= 1

    val
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if self.length == capacity

    self.length += 1
    self[length - 1] = val
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if self.length == 0

    val = self[0]
    (1...length).each do |idx|
      self[idx - 1] = self[idx]
    end
    self.length -= 1

    val
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if self.length == capacity

    self.length += 1
    # substract 2 to account for adding to length
    (self.length - 2).downto(0).each do |idx|
      self[idx + 1] = self[idx]
    end

    # have to do this step last or will overwrite pos
    self[0] = val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    unless (index >= 0) && (index < self.length)
      raise "index out of bounds"
    end
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_capacity = capacity * 2
    new_store = StaticArray.new(new_capacity)

    self.length.times do |idx|
      new_store[idx] = store[idx]
    end

    self.capacity = new_capacity
    self.store = new_store
  end
end
