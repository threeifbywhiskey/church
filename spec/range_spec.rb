require 'spec_helper'

include Church

describe 'RANGE' do
  it "should work without a supplied step" do
    expect(RANGE[1, 3]).to eq [1, 2, 3]
  end

  it "should work with a step" do
    expect(RANGE[2, 6, 2]).to eq [2, 4, 6]
  end

  it "should work with a negative start" do
    expect(RANGE[-1, 1]).to eq [-1, 0, 1]
  end
end
