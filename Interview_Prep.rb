# Array merge that doesn't mutate the original array

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
