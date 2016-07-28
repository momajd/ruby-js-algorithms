# CCI 4.4 Check Balanced

class Node
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
  attr_accessor :val, :left, :right
end

def max_depth(root)
  return 0 if root.nil?

  [max_depth(root.left), max_depth(root.right)].max + 1
end

def is_balanced?(root)
  return true if root.nil?
  left_depth = max_depth(root.left)
  right_depth = max_depth(root.right)

  return false if (left_depth - right_depth).abs > 1

  is_balanced?(root.left) && is_balanced?(root.right)
end

a = Node.new(1)
b = Node.new(2)
c = Node.new(3)
d = Node.new(4)
e = Node.new(5)
f = Node.new(6)
g = Node.new(7)
a.left = b
a.right = c
b.left = d
b.right = e
c.left = f
c.right = g
