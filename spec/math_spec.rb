require 'spec_helper'
require 'prime'

include Church

describe 'SQRT' do
  it "should return its argument's square root" do
    expect(SQRT[5]).to eq Math.sqrt 5
  end
end

describe 'FLOOR' do
  it "should round its argument down" do
    expect(FLOOR[2.5]).to eq 2
  end
end

describe 'PRIME' do
  (-6..6).each do |i|
    it "should return its argument's primality" do
      expect(PRIME[i]).to be i.prime?
    end
  end
end
