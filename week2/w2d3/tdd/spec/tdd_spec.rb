require 'tdd'
require 'byebug'

describe 'Array#uniq' do
  it "raises in error if not passed an array" do
    expect { my_uniq("123") }.to raise_error("Please pass an array.")
  end

  it "returns an array" do
    expect(my_uniq([1,2,3])).to be_a(Array)
  end

  it "removes duplicates" do
    expect(my_uniq([1, 2, 1, 3, 3]).count(1)).to eq(1)
    expect(my_uniq([1, 2, 1, 3, 3]).count(2)).to eq(1)
    expect(my_uniq([1, 2, 1, 3, 3]).count(3)).to eq(1)
  end

  it "returns the unique elements in the order in which the first appeared" do
    expect(my_uniq([1, 2, 1, 3, 3])).to eq([1,2,3])
  end
end

describe 'Array#two_sum' do
  it "raises in error if not passed an array" do
    expect { two_sum("-1, 0, 2, -2, 1") }.to raise_error("Please pass an array.")
  end

  it "returns an array" do
    expect(two_sum([-1, 0, 2, -2, 1])).to be_a(Array)
  end

  it "returns pairs of positions dictionary-wise where the elements at those positions sum to zero" do
    expect(two_sum([-1, 0, 2, -2, 1])).to eq([[0, 4], [2, 3]])
  end
end

describe 'Array#my_transpose' do
  it "raises in error if not passed an array" do
    expect { my_transpose("[0, 1, 2], [3, 4, 5], [6, 7, 8]") }.to raise_error("Please pass an array.")
  end

  it "returns an array" do
    expect(my_transpose([ [0, 1, 2], [3, 4, 5], [6, 7, 8] ])).to be_a(Array)
  end

  it "returns a porperly transposed array" do
    expect(my_transpose([ [0, 1, 2], [3, 4, 5], [6, 7, 8] ])).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end
end

describe 'Array#stock_picker' do
  it "raises in error if not passed an array" do
    expect { stock_picker("2,4,10,6,7,8,1,5,3,9") }.to raise_error("Please pass an array.")
  end

  it "raises in error if the array is not large enough to create a pair" do
    expect { stock_picker([]) }.to raise_error("Not enough days to create a pair.")
    expect { stock_picker([50]) }.to raise_error("Not enough days to create a pair.")
  end

  it "returns an array" do
    expect(stock_picker([2,4,10,6,7,8,1,5,3,9])).to be_a(Array)
  end

  it "returns the most profiable pair of days on which to first buy the stock and then sell the stock" do
    expect(stock_picker([2,4,10,6,7,8,1,5,3,9])).to eq([0,2])
  end
end
