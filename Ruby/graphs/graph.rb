require 'Set'

class Vertex
  def initialize(val)
    @val = val
    @adjacents = Set.new
    @incoming = Set.new
  end
  attr_accessor :val, :adjacents, :incoming

  def inspect
    @val.to_s
  end
end

class Graph
  def initialize
    @vertices = Set.new
  end
  attr_reader :vertices

  def add_edge(v1, v2) #v1 to v2
    @vertices.add(v1)
    @vertices.add(v2)
    v1.adjacents.add(v2)
    v2.incoming.add(v1)
  end
end

# v1 = Vertex.new(1)
# v2 = Vertex.new(2)
# v3 = Vertex.new(3)
# v4 = Vertex.new(4)
# v5 = Vertex.new(5)
# v6 = Vertex.new(6)
#
# graph = Graph.new
# graph.add_edge(v1, v2)
# graph.add_edge(v1, v3)
# graph.add_edge(v2, v4)
# graph.add_edge(v4, v5)
# graph.add_edge(v4, v3)
# graph.add_edge(v3, v6)
