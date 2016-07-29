# CCI 4.5 - Validate BST
# Implement a function to check if a binary tree is a BST

class Node
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
  attr_accessor :val, :left, :right
end


def validate_bst(root, max = Float::INFINITY, min = -Float::INFINITY)
  return true if root.nil?
  return false if root.val >= max || root.val <= min

  left_max = root.val
  right_min = root.val

  validate_bst(root.left, left_max, min) &&
    validate_bst(root.right, max, right_min)
end
