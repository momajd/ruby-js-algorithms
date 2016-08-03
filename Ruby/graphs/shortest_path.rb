require_relative 'graph.rb'

#return the shortest path for an unweighted directed graph

def shortest_path(root, target)
  queue = [root]
  previous = {root => nil}

  until queue.empty?
    current = queue.shift
    break if current == target

    current.adjacents.each do |vertex|
      next if previous.include?(vertex)
      queue << vertex
      previous[vertex] = current
    end
  end
  #return if we did not reach the target
  raise 'no path exists' unless current == target

  # now we go backwards from our target using the 'previous' hash
  path = [target]
  until current == root
    path.unshift(previous[current])
    current = previous[current]
  end
  path
end
