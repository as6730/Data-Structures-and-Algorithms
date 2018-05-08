# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

# 1 is dependent on 5
# 5 is dependent on 3
# 2 is dependent on 17
# 3 is dependent on 2
#
# The order of installation should be:
# 17, 2, 3, 5, 1

# [[3, 1], [2, 1], [6, 5], [3, 6], [3, 2], [4, 3], [9, 1]]

# tuple[0] represents a package id
# and tuple[1] represents its dependency

def install_order(arr)
  queue = (1 .. arr.flatten.max).to_a
  hash = Hash.new { |h, k| h[k] = [] }
  arr.each { |el| hash[el[0]] += [el[1]] }

  queue = queue.reject{ |id| hash.keys.include?(id)}
  order = []

  until queue.empty?
    id = queue.shift
    order << id

    hash.keys.each do |hash_id|
      hash[hash_id] -= [id]

      if hash[hash_id].empty?
        queue << hash_id
        hash.delete(hash_id)
      end
    end

  end

  order
end
