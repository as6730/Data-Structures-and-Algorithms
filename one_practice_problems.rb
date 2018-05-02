# O(logn) should remind you of Binary Search.
# What condition are we checking for?
# How do we know which direction to go in next?

arr_one = [1, 2, 2, 3, 3, 5, 5, 6, 6]

def find_single_int(sorted_arr)
  low = 0
  high = arr.length - 1
  # stopping condition is when our window has closed
  while low < high
    mid = ((high - low) / 2) + low
    # returning the item if it doesn't have a pair nearby
    return arr[mid] if arr[mid] != arr[mid - 1] && arr[mid] != arr[mid + 1]
    # if the index is odd and there is a pair below,
    # then the single element is above us
    # if index is even and the pair is above, same;
    # otherwise, the single element is below us
    if (arr[mid] == arr[mid - 1] && mid.odd?) ||
      (arr[mid] == arr[mid + 1] && mid.even?)
      low = mid + 1
    else
      high = mid - 1
    end
  end

  # if we haven't returned yet, then the single
  # element is at the idx we closed over
  arr[low]
end

# A string with the characters [,], {,}, (,) is said to be
# well-formed if the different types of brackets match in the correct order
# For example, ([]){()} is well-formed, but [(]{)} is not.
# Write a function to test whether a string is well-formed

# Hints
# Perfect situation for a stack
# If we store all left brackets in a stack then every time we encounter
# a right bracket, its pair should be on the top of the stack, or else
# it is unmatched
# Additionally, if there are any unmatched left brackets at the end,
# the string is not well-formed

def well_formed_str(str)
  left_chars = []
  lookup = { '(' => ')', '[' => ']', '{' => '}' }

  str.chars.each do |char|
    if lookup.keys.include?(char)
      left_chars << char
    elsif left_chars.length == 0 || lookup[left_chars.pop] != char
      return false
    end
  end

  return left_chars.empty?
end
