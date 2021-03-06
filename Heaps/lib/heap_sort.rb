require_relative "heap"

# solution works more elegantly if using a MaxHeap
# meaning that the parent needs to be larger than the child

class Array
  def heap_sort!
    2.upto(count).each do |heap_size|
      BinaryMinHeap.heapify_up(self, heap_size - 1, heap_size)
    end

    count.downto(2).each do |heap_size|
      self[heap_size - 1], self[0] = self[0], self[heap_size - 1]
      BinaryMinHeap.heapify_down(self, 0, heap_size - 1)
    end

    self.reverse!
  end
end


# example_input = [[3, 5, 7], [0, 6], [0, 6, 28]]

def 500_files(input)
  # naive solution is to flatten and sort

  
end
