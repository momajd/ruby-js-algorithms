require 'rspec'
require 'check_balanced'

describe '#is_balanced' do
  it 'returns true for a balanced tree' do
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

    expect(is_balanced?(a)).to be true
  end

  it 'returns false for a unbalanced tree' do
    a = Node.new(1)
    b = Node.new(2)
    c = Node.new(3)
    d = Node.new(4)
    e = Node.new(5)
    f = Node.new(6)
    a.left = b
    b.left = c
    c.left = d
    d.left = e
    a.right = f

    expect(is_balanced?(a)).to be false
  end
end
