require 'spec_helper'

include Church

describe 'ADD' do
  it "should work with an LHS of 0" do
    expect(ADD[0, 2]).to be 2
  end

  it "should work with an RHS of 0" do
    expect(ADD[3, 0]).to be 3
  end

  it "should work with a negative LHS" do
    expect(ADD[-2, 4]).to be 2
  end

  it "should work with a negative RHS" do
    expect(ADD[2, -4]).to be -2
  end

  it "should work with two negatives" do
    expect(ADD[-2, -4]).to be -6
  end
end

describe 'SUB' do
  it "should work with an LHS of 0" do
    expect(SUB[0, 2]).to be -2
  end

  it "should work with an RHS of 0" do
    expect(SUB[3, 0]).to be 3
  end

  it "should work with a negative LHS" do
    expect(SUB[-2, 4]).to be -6
  end

  it "should work with a negative RHS" do
    expect(SUB[2, -4]).to be 6
  end

  it "should work with two negatives" do
    expect(SUB[-2, -4]).to be 2
  end
end

describe 'MUL' do
  it "should work with an LHS of 0" do
    expect(MUL[0, 2]).to be 0
  end

  it "should work with an RHS of 0" do
    expect(MUL[3, 0]).to be 0
  end

  it "should work with a negative LHS" do
    expect(MUL[-2, 4]).to be -8
  end

  it "should work with a negative RHS" do
    expect(MUL[2, -4]).to be -8
  end

  it "should work with two negatives" do
    expect(MUL[-2, -4]).to be 8
  end
end

describe 'DIV' do
  it "should work with an LHS of 0" do
    expect(DIV[0, 2]).to be 0
  end

  it "should work with a negative RHS" do
    expect(DIV[4, -2]).to be -2
  end

  it "should divide numbers into themselves once" do
    expect(DIV[3, 3]).to be 1
  end

  it "should truncate" do
    expect(DIV[3, 4]).to be 0
  end
end
