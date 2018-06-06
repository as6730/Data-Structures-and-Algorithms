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
