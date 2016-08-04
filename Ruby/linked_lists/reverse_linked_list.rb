class Node
  def initialize(val)
    @val = val
    @next = nil
  end
  attr_accessor :val, :next
end

def reverse(head)
  new_head = nil

  until head.nil?
    temp = head.next
    head.next = new_head
    new_head = head
    head = temp
  end

  new_head
end

def reverse_rec(head, new_head = nil)
  return new_head if head.nil?

  next_node = head.next
  head.next = new_head
  reverse_rec(next_node, head)
end
