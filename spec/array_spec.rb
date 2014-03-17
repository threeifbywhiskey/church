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
