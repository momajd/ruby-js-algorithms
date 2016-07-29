require 'rspec'
require 'check_balanced'

describe '#is_balanced' do
  let(:n1) { Node.new(1) }
  let(:n2) { Node.new(2) }
  let(:n3) { Node.new(3) }
  let(:n4) { Node.new(4) }
  let(:n5) { Node.new(5) }
  let(:n6) { Node.new(6) }

  before(:each) do
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    n3.left = n6
  end

  it 'returns true for a balanced tree' do
    expect(is_balanced?(n1)).to be true
  end

  it 'returns false for a unbalanced tree' do
    n7 = Node.new(7)
    n6.left = n7

    expect(is_balanced?(n1)).to be false
  end
end
