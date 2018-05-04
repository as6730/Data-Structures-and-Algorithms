class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array, &prc)
    prc ||= Proc.new { |a, b| a <=> b }
    return array if array.length <= 1

    pivot = array[0]
    left = array[1..-1].select { |el| prc.call(el, pivot) == -1 }
    right = array[1..-1].select { |el| prc.call(el, pivot) != -1 }

    QuickSort.sort1(left, &prc) + [pivot] + QuickSort.sort1(right, &prc)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }
    return array if length <= 1

    pivot_idx = QuickSort.partition(array, start, length, &prc)
    left_arr_len = pivot_idx - start
    right_arr_len = length - pivot_idx - 1

    QuickSort.sort2!(array, start, left_arr_len, &prc)
    QuickSort.sort2!(array, (pivot_idx + 1), right_arr_len, &prc)

    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }

    pivot_idx = start
    pivot = array[start]

    ((start + 1)...(start + length)).each do |idx|
      # swap if the pivot is greater than the element
      if prc.call(pivot, array[idx]) == 1
        temp = array[pivot_idx + 1]
        array[pivot_idx + 1] = array[idx]
        array[idx] = temp

        pivot_idx += 1
      end
    end

    temp = array[pivot_idx]
    array[pivot_idx] = array[start]
    array[start] = temp

    pivot_idx
  end
end
