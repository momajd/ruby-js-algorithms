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

def topological_sort(graph)
  sorted = []
  queue = []
  in_edge_count = {}

  graph.vertices.each do |vertex|
    queue << vertex if vertex.incoming.count.zero?
    in_edge_count[vertex] = vertex.incoming.count
  end

  until queue.empty?
    vertex = queue.shift
    sorted << vertex

    vertex.adjacents.each do |adjacent|
      in_edge_count[adjacent] -= 1
      queue << adjacent if in_edge_count[adjacent].zero?
    end
  end
  sorted
end
