class Vertex
  attr_accessor :value
  attr_reader :in_edges, :out_edges

  def initialize(value)
    @in_edges = []
    @out_edges = []
    @value = value
  end
end

class Edge
  attr_reader :from_vertex, :to_vertex, :cost

  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex = from_vertex
    @to_vertex= to_vertex
    @cost = cost
    @to_vertex.in_edges << self
    @from_vertex.out_edges << self
  end

  def destroy!
    @to_vertex.in_edges.delete(self)
    @from_vertex.out_edges.delete(self)
    @to_vertex, @from_vertex = nil, nil
  end
end
