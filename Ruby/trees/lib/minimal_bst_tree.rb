# CCI - 4.2
# Minimal Tree: Given a sorted (increasing order) array with unique integer
# elements, write an algorithm to create a BST with minimal height

class Node
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
  attr_accessor :val, :left, :right
end

def create_minimal_bst(arr)
  return if arr.nil? || arr.empty?

  mid_idx = arr.length / 2
  left = arr[0...mid_idx]
  right = arr[mid_idx + 1..-1]

  root = Node.new(arr[mid_idx])
  root.left = create_minimal_bst(left)
  root.right = create_minimal_bst(right)

  root
end
