# CCI 4.9 - BST Sequences
# see solution for good analysis on time complexity

class Node
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
  attr_accessor :val, :left, :right
end

# Simple approach - builds a string and checks inclusion
# O(n + m) time, O(n + m) space
def pre_order_values(root, order = "")
  if root.nil?
    order.concat("X") #placeholder to maintain tree structure
    return
  else
    order.concat(root.val.to_s)
  end
  pre_order_values(root.left, order)
  pre_order_values(root.right, order)

  order
end

def subtree?(root1, root2)
  pre_order_values(root1).include?(pre_order_values(root2))
end

# Better approach
# O(n + km) time, where k is the number of matched root nodes
# O(log(n) + log(m)) space

def is_match?(root1, root2)
  return true if root1.nil? && root2.nil?
  return false if root1.nil? || root2.nil? || root1.val != root2.val

  is_match?(root1.left, root2.left) && is_match?(root1.right, root2.right)
end

def subtree?(root1, root2)
  return true if root1.nil? && root2.nil?
  return false if root1.nil?

  if root1.val == root2.val
    return true if is_match?(root1, root2)
  end

  subtree?(root1.left, root2) || subtree?(root1.right, root2)
end

# n1 = Node.new(1)
# n2 = Node.new(2)
# n3 = Node.new(3)
# n4 = Node.new(4)
# n5 = Node.new(5)
# n6 = Node.new(6)
# n7 = Node.new(7)
# n8 = Node.new(8)
#
# n1.left = n2
# n2.left = n3
# n1.right = n4
# n4.left = n5
# n4.right = n6
# n6.left = n7
# n6.right = n8
