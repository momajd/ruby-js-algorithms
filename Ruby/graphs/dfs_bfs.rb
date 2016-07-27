# Simple implementation that returns the vertex with the target value
require 'Set'

def dfs(root, val, visited = Set.new)
  return root if root.val == val
  visited.add(root)

  root.adjacents.each do |vertex|
    next if visited.include?(vertex)
    vertex = dfs(vertex, val, visited)
    return vertex if vertex
  end
  nil
end

def bfs(root, val)
  queue = [root]
  seen = Set.new

  until queue.empty?
    current = queue.shift
    return current if current.val == val
    seen.add(current)
    current.adjacents.each {|v| queue << v unless seen.include?(v)}
  end
end
