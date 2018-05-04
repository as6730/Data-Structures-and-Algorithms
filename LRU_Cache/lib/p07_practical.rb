require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  hash_map = HashMap.new

  string.chars.each do |char|
    if hash_map.include?(char)
      hash_map[char] += 1
    else
      hash_map[char] = 1
    end
  end

  odds = hash_map.select do |_key, val|
    val.odd?
  end

  odds.count <= 1
end
