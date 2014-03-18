require 'spec_helper'

include Church::Utils

describe 'ROT13' do
  it "should rotate a lowercase letter 13 places" do
    expect(ROT13['a']).to eq 'n'
    expect(ROT13['n']).to eq 'a'
  end

  it "should rotate an uppercase letter 13 places" do
    expect(ROT13['M']).to eq 'Z'
    expect(ROT13['Z']).to eq 'M'
  end

  it "should not touch a non-alphabetical character" do
    expect(ROT13['!']).to eq '!'
    expect(ROT13[' ']).to eq ' '
  end
end

describe 'COLLATZ' do
  it "should return its arguments Collatz sequence as an array" do
    expect(COLLATZ[10]).to eq [10, 5, 16, 8, 4, 2, 1]
  end

  it "should work on 194" do
    expect(SIZE[COLLATZ[194]]).to be 120
  end
end
