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
end
