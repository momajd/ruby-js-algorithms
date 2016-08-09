# CCI 4.8 - First Common Ancestor

class Node
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
  attr_accessor :val, :left, :right
end

def dfs(root, target)
  return if root.nil?
  return true if root == target
  dfs(root.left, target) || dfs(root.right, target)
end

def common_ancestor_helper(root, p, q)
  return root if root == p || root == q

  p_on_left = dfs(root.left, p)
  q_on_left = dfs(root.left, q)

  if p_on_left != q_on_left #p and q on opposite sides
    return root
  end

  child_to_search = p_on_left ? root.left : root.right
  common_ancestor_helper(child_to_search, p, q)
end

def common_ancestor(root, p, q)
  return unless dfs(root, p) && dfs(root, q) #make sure p & q are in tree
  common_ancestor_helper(root, p, q)
end
