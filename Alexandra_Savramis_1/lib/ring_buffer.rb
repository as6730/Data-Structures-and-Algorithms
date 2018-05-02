require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    self.store = StaticArray.new(8)
    self.capacity = 8
    self.start_idx = 0
    self.length = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    # always mod by the capacity to wrap around
    store[(start_idx + index) % capacity]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    store[(start_idx + index) % capacity] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" unless self.length > 0

    val = self[length - 1]
    self[length - 1] = nil
    self.length -= 1

    val
  end

  # O(1) ammortized
  def push(val)
    resize! if self.length == capacity

    self.length += 1
    self[length - 1] = val
  end

  # O(1)
  def shift
    raise "index out of bounds" if self.length == 0

    val = self[0]
    self[0] = nil
    self.start_idx = (start_idx + 1) % capacity
    self.length -= 1

    val
  end

  # O(1) ammortized
  def unshift(val)
    resize! if self.length == capacity

    self.length += 1
    self.start_idx = (start_idx - 1) % capacity
    self[0] = val

    nil
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    unless (index >= 0) && (index < self.length)
      raise "index out of bounds"
    end
  end

  def resize!
    new_capacity = capacity * 2
    new_store = StaticArray.new(new_capacity)

    self.length.times do |idx|
      new_store[idx] = store[idx]
    end

    self.capacity = new_capacity
    self.store = new_store
    self.start_idx = 0
  end
end
