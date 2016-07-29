require 'rspec'
require 'validate_bst'

describe '#validate_bst' do
  let(:n1) { Node.new(1) }
  let(:n2) { Node.new(2) }
  let(:n3) { Node.new(3) }
  let(:n4) { Node.new(4) }
  let(:n5) { Node.new(5) }
  let(:n6) { Node.new(6) }
  let(:n7) { Node.new(7) }

  before(:each) do
    n4.left = n2
    n2.left = n1
    n2.right = n3
    n4.right = n6
    n6.left = n5
    n6.right = n7
  end

  it 'returns true if tree is a bst' do
    expect(validate_bst(n4)).to be true
  end

  it 'returns false if tree is not a bst' do
    n0 = Node.new(0)
    n5.left = n0

    expect(validate_bst(n4)).to be false
  end
end
