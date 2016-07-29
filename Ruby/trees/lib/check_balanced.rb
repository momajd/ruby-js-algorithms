# CCI 4.4 Check Balanced
# Implement a function to check if a binary tree is balanced 

class Node
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
  attr_accessor :val, :left, :right
end


def check_depth(root)
  return 0 if root.nil?

  left_depth = check_depth(root.left)
  right_depth = check_depth(root.right)

  return -1 if left_depth == -1 || right_depth == -1

  if (left_depth - right_depth).abs > 1
    return -1
  else
    [left_depth, right_depth].max + 1
  end
end

def is_balanced?(root)
  check_depth(root) == -1 ? false : true
end


# Bad - O(n log n)
# def max_depth(root)
#   return 0 if root.nil?
#
#   [max_depth(root.left), max_depth(root.right)].max + 1
# end
#
# def is_balanced?(root)
#   return true if root.nil?
#   left_depth = max_depth(root.left)
#   right_depth = max_depth(root.right)
#
#   return false if (left_depth - right_depth).abs > 1
#
#   is_balanced?(root.left) && is_balanced?(root.right)
# end
