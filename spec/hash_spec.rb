require 'spec_helper'

include Church

describe 'KEYS' do
  it "should return the hash's keys" do
    expect(KEYS[{a: 1, b: 2, c: 3}]).to eq [:a, :b, :c]
  end
end

describe 'VALUES' do
  it "should return the hash's values" do
    expect(VALUES[{a: 1, b: 2, c: 3}]).to eq [1, 2, 3]
  end
end

describe 'INVERT' do
  it "should invert the hash's keys and values" do
    expect(INVERT[{a: 1, b: 2, c: 3}]).to eq({1 => :a, 2 => :b, 3 => :c})
  end
end

describe 'MERGE' do
  it "should merge two hashes" do
    expect(MERGE[{a: 1, b: 2}, {c: 3, d: 4}]).to eq({a: 1, b: 2, c: 3, d: 4})
  end
end
