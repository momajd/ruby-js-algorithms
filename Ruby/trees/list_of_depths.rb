class TreeNode
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
  attr_accessor :val, :left, :right
end

class LinkedListNode
  def initialize(val)
    @val = val
    @next = nil
  end
  attr_accessor :val, :next

  def inspect
    node = self
    nodes = []
    while node
      nodes << node.val.val
      node = node.next
    end
    nodes.join(" > ")
  end
end

def list_depths_bfs(root)
  queue = [root]
  levels = []

  until queue.empty?
    length = queue.length #the queue will contain the entire level at this point
    list_head = LinkedListNode.new(nil) #create dummy head
    list_current_node = list_head

    length.times do
      current = queue.shift
      list_current_node.next = LinkedListNode.new(current)
      list_current_node = list_current_node.next

      queue << current.left if current.left
      queue << current.right if current.right
    end
    levels << list_head.next
  end
  levels
end

a = TreeNode.new(1)
b = TreeNode.new(2)
c = TreeNode.new(3)
d = TreeNode.new(4)
e = TreeNode.new(5)
f = TreeNode.new(6)
g = TreeNode.new(7)
a.left = b
a.right = c
b.left = d
b.right = e
c.left = f
c.right = g
