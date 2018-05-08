require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  hash = {}
  queue = []

  vertices.each do |vertex|
    hash[vertex] = vertex.in_degree

    if vertex.in_degree.zero?
      queue << vertex
    end
  end


  dependency = []

  until queue.empty?
    vertex = queue.shift
    dependency << vertex
    hash.delete(vertex)

    vertex.out_edges.each do |edge|
      node = edge.to_vertex
      hash[node] -= 1
      if hash[node].zero?
        queue << node
      end
    end
  end

  if hash.keys.empty?
    return dependency
  end

  []
end
