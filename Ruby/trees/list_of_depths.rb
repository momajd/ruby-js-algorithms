# CCI #4.3 - List of Depths
# Given a binary tree, design an algorithm which creates a linked list of all
# the nodes at each depth

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
    @val.to_s
  end
end

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def add(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end

  def inspect
    current = @head
    list = []
    while current
      list << current.val.val #will be val of tree node
      current = current.next
    end
    list.join(" > ")
  end
end

def list_depths_bfs(root)
  queue = [root]
  lists = []

  until queue.empty?
    length = queue.length #the queue will contain the entire level at this point
    list = LinkedList.new

    length.times do
      current = queue.shift
      list.add(LinkedListNode.new(current))

      queue << current.left if current.left
      queue << current.right if current.right
    end
    lists << list
  end
  lists
end

def list_depths_dfs(root, lists = [], level = 0)
  return if root.nil?

  if lists.length == level #we've reached a new level not previously seen
    lists << LinkedList.new #create new level
  end
  lists[level].add(LinkedListNode.new(root))

  list_depths_dfs(root.left, lists, level + 1)
  list_depths_dfs(root.right, lists, level + 1)

  lists
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
