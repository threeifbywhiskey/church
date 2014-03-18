require 'spec_helper'

include Church

describe 'CHR' do
  it "should return its argument's corresponding character" do
    expect(CHR[83]).to eq 83.chr
  end
end

describe 'ORD' do
  it "should return its argument's corresponding ordinal value" do
    expect(ORD['q']).to be 'q'.ord
  end
end

describe 'CHARS' do
  it "should return an array of the string's characters" do
    expect(CHARS['Ruby']).to eq %w[R u b y]
  end
end

describe 'JOIN' do
  it "should join a string on a delimiter" do
    expect(JOIN[[1, 2, 3], ',']).to eq '1,2,3'
  end

  it "should be able to join on an empty delimeter" do
    expect(JOIN[[1, 2, 3], '']).to eq '123'
  end
end
