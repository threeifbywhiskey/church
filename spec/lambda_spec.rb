require 'spec_helper'

include Church

describe 'COMPOSE' do
  ADD_TWO = -> x { 2 + x }
  MUL_SIX = -> x { 6 * x }
  SIX_X_PLUS_TWO = COMPOSE[ADD_TWO, MUL_SIX]

  (-2..2).each do |x|
    it "should compose two lambdas f and g and return f[g[x]]" do
      expect(SIX_X_PLUS_TWO[x]).to be x * 6 + 2
    end
  end
end
