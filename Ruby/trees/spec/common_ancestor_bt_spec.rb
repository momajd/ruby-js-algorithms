require 'rspec'
require 'common_ancestor_bt'

describe '#validate_bst' do
  let(:n1) { Node.new(1) }
  let(:n2) { Node.new(2) }
  let(:n3) { Node.new(3) }
  let(:n4) { Node.new(4) }
  let(:n5) { Node.new(5) }
  let(:n6) { Node.new(6) }
  let(:n7) { Node.new(7) }
  let(:n8) { Node.new(8) }

  before(:each) do
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    n3.left = n6
    n3.right = n7
    n7.left = n8
  end

  it 'returns nil if p or q are not in tree' do
    n9 = Node.new(9)
    n10 = Node.new(10)
    expect(common_ancestor(n1, n9, n10)).to be nil
    expect(common_ancestor(n1, n8, n9)).to be nil
  end

  it 'returns lowest common ancestor of two nodes' do
    expect(common_ancestor(n1, n6, n8)).to eq n3
  end

  it 'returns p if p is ancestor of q' do
    expect(common_ancestor(n1, n2, n5)).to eq n2
  end
end
