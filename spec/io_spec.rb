require 'spec_helper'

include Church

describe "CHR" do
  (1..122).each do |ord|
    it "should return its argument's corresponding character" do
      expect(CHR[ord]).to eq ord.chr
    end
  end
end

describe "ORD" do
  ("\1".."z").each do |chr|
    it "should return its argument's corresponding ordinal value" do
      expect(ORD[chr]).to be chr.ord
    end
  end
end
