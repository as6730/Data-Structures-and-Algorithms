# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store

  def initialize
    @store = RingBuffer.new
  end

  def enqueue(val)
    @store.push(val)
    self.store_maxqueue(val)
  end

  def dequeue
    val = @store.shift
    # @maxqueue.shift if val == maxqueue[0]
    val
  end

  def max
    maxqueue[0] if maxqueue.length > 0
  end

  def store_maxqueue(val)

  end

  def length
    @store.length
  end
end
