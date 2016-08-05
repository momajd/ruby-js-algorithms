# CCI 4.7 - Build Order
# this question is essential asking for topological sort

require 'Set'

class Vertex
  def initialize(val)
    @val = val
    @adjacents = Set.new
    @incoming_edges = 0
  end
  attr_accessor :val, :adjacents, :incoming_edges

  def add_adjacent(vertex)
    vertex.incoming_edges += 1
    @adjacents.add(vertex)
  end

  def remove_adjacent(vertex)
    return unless @adjacents.include?(vertex)
    vertex.incoming_edges -= 1
    @adjacents.delete(vertex)
  end

  def inspect
    @val.to_s
  end
end

class Graph
  def initialize(projects, dependencies)
    @vertices = {} #store string as keys and vertex as value

    projects.each {|project| add_vertex(project)}
    dependencies.each {|dependency| add_dependency(dependency[0], dependency[1])}
  end
  attr_reader :vertices

  def add_vertex(project)
    @vertices[project] = Vertex.new(project)
  end

  def add_dependency(project1, project2) #project1 is dependent on project2
    vertex1 = @vertices[project1]
    vertex2 = @vertices[project2]

    vertex2.add_adjacent(vertex1)
  end

  def empty?
    @vertices.empty?
  end

  def delete(project)
    @vertices.delete(project)
  end
end

def build_order(projects, dependencies)
  graph = Graph.new(projects, dependencies)
  order = []

  until graph.empty?
    project_name, vertex = graph.vertices.find {|project, vertex| vertex.incoming_edges.zero? }
    raise 'no build order possible' unless project_name

    graph.delete(project_name)
    vertex.adjacents.each {|adjacent| vertex.remove_adjacent(adjacent) }
    order << project_name
  end
  order
end
