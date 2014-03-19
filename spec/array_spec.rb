require 'spec_helper'

include Church

describe 'SIZE' do
  it "should return the size of a String" do
    expect(SIZE['abc']).to be 3
  end

  it "should return the size of an Array" do
    expect(SIZE[[1, 2, 3]]).to be 3
  end
end

describe 'MAP' do
  it "should properly implement map as a top-level lambda" do
    expect(MAP[[1, 2, 3], &-> c { c * 2 }]).to eq [2, 4, 6]
  end

  it "should work with to_proc'd Symbols" do
    expect(MAP[[1, 2, 3], &:even?]).to eq [false, true, false]
  end
end

describe 'MAP_BANG' do
  let(:coll) { [1, 2, 3] }

  it "should modify the original array" do
    MAP_BANG[coll, &-> c { c * 2 }]
    expect(coll).to eq [2, 4, 6]
  end
end

describe 'REDUCE' do
  it "should properly implement reduce as a top-level lambda" do
    expect(REDUCE[[1, 2, 3, 4], &:+]).to be 10
  end
end

describe 'FILTER' do
  it "should properly filter elements from collections" do
    expect(FILTER[[1, 2, 3, 4], &:even?]).to eq [2, 4]
  end
end

describe 'REVERSE' do
  it "should reverse an array" do
    expect(REVERSE[[1, 2, 3]]).to eq [3, 2, 1]
  end

  it "should reverse a string" do
    expect(REVERSE["Ruby"]).to eq "ybuR"
  end
end

describe 'SORT' do
  it "should sort an array" do
    expect(SORT[[4, 3, 2, 2, 1, 3]]).to eq [1, 2, 2, 3, 3, 4]
  end
end

describe 'SORT_BY' do
  let(:order) { [1, 2, 3, 4, 5] }

  it "should sort an array using the supplied function" do
    expect(SORT_BY[[4, 2, 5, 1, 3], &-> n { order.index n }]).to eq order
  end
end

describe 'RSORT' do
  it "should sort an array in reverse order" do
    expect(RSORT[[2, 1, 3]]).to eq [3, 2, 1]
  end
end

describe 'INDEXED' do
  it "should zip a collection with indices" do
    expect(INDEXED[[1, 2, 3]]).to eq [[1, 0], [2, 1], [3, 2]]
  end
end

describe 'EACH' do
  it "should perform fn for each element in coll" do
    x = 0
    EACH[[1, 2, 3], &-> n { x += n }]
    expect(x).to be 6
  end
end

describe 'DROP' do
  it "should drop the first n elements of a collection" do
    expect(DROP[[1, 2, 3, 4], 2]).to eq [3, 4]
  end
end

describe 'TAKE' do
  it "should take the first n elements of a collection" do
    expect(TAKE[[1, 2, 3, 4], 2]).to eq [1, 2]
  end
end

describe 'INDEX' do
  it "should find the indices of characters within strings" do
    expect(INDEX['abc', 'b']).to be 1
    expect(INDEX['abc', 'd']).to be nil
  end

  it "should find the indices of elements within arrays" do
    expect(INDEX[[1, 2, 3], 3]).to be 2
    expect(INDEX[[1, 2, 3], 4]).to be nil
  end
end
