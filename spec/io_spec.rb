require 'spec_helper'

include Church

describe 'CHR' do
  (1..122).each do |ord|
    it "should return its argument's corresponding character" do
      expect(CHR[ord]).to eq ord.chr
    end
  end
end

describe 'ORD' do
  ("\1".."z").each do |chr|
    it "should return its argument's corresponding ordinal value" do
      expect(ORD[chr]).to be chr.ord
    end
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
