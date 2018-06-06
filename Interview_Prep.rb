# Array merge that doesn't mutate the original array
class Array
  def mergesort(list)
    return list if list.size <= 1
    mid   = list.size / 2
    left  = list[0...mid]
    right = list[mid...list.size]
    merge(mergesort(left), mergesort(right))
  end

  def merge(left, right)
    sorted = []
    until left.empty? || right.empty?
      if left.first <= right.first
        sorted << left.shift
      else
        sorted << right.shift
      end
    end
    sorted.concat(left).concat(right)
  end
end


class Array
  def merge_sort(&prc)
    merge_sort_with_arr(self, &prc)
  end

  private
  def merge_sort_with_arr(arr, &prc)
    return arr if arr.length <= 1
    mid_idx = arr.length / 2

    return Array.merge(merge_sort_with_arr(arr[0...mid_idx], &prc), merge_sort_with_arr(arr[mid_idx..-1], &prc), &prc)
  end

  def self.merge(left, right, &prc)
    prc ||= Proc.new {|a, b| a <=> b}
    merged = []
    n = left.length + right.length
    i, j = 0, 0

    (0...n).each do
      if i == left.length
        merged << right[j]
        j += 1
        next
      elsif j == right.length
        merged << left[i]
        i += 1
        next
      end

      if prc.call(left[i], right[j]) == -1
        merged << left[i]
        i += 1
      else
        merged << right[j]
        j += 1
      end
    end
    merged
  end
end

# Bubble sort

class Array
  def bubble_sort!(&prc)
    prc ||= Proc.new {|a, b| a <=> b}

    self.length.times do
      self.each_index do |j|
        break if j == self.length - 1
        k = j + 1
        if prc.call(self[j], self[k]) == 1
          self[j], self[k] = self[k], self[j]
        end
      end
    end

    self
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end
end

# Binary search

class Array

  def my_bsearch(target, &prc)
    prc ||= Proc.new {|a, b| a <=> b}
    my_bsearch_with_arr(self, target, 0, prc)
  end

  def my_bsearch_with_arr(arr, target, shift, prc)
    return nil if arr.empty?

    mid_idx = arr.length / 2
    curr_value = arr[mid_idx]

    case prc.call(target, curr_value)
      when 0
        return mid_idx + shift
      when 1
        return my_bsearch_with_arr(arr[(mid_idx + 1)..-1], target, shift + mid_idx + 1, prc)
      when -1
        return my_bsearch_with_arr(arr[0...mid_idx], target, shift, prc)
    end
  end

end

# Write a method that doubles each element in an array
def doubler(array)
  array.map { |num| num * 2 }
end
