# LeetCode 102. Binary Tree Level Order Traversal
# Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
#
# For example:
# Given binary tree [3,9,20,null,null,15,7],
#     3
#    / \
#   9  20
#     /  \
#    15   7
# return its level order traversal as:
# [
#   [3],
#   [9,20],
#   [15,7]
# ]

class Node
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
  attr_accessor :val, :left, :right
end

def level_order(root, levels = [], level = 0)
  return if root.nil?

  if levels[level]
    levels[level] << root.val
  else
    levels[level] = [root.val]
  end

  level_order(root.left, levels, level + 1)
  level_order(root.right, levels, level + 1)
  levels
end

n1 = Node.new(1)
n2 = Node.new(2)
n3 = Node.new(3)
n4 = Node.new(4)
n5 = Node.new(5)
n6 = Node.new(6)

n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
n3.left = n6

#      1
#   2    3
# 4  5  6
