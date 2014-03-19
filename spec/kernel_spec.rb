require 'spec_helper'
require 'stringio'

include Church::Kernel

describe 'KERNEL' do
  it "should be the same object as Kernel" do
    expect(KERNEL).to be Kernel
  end
end

describe 'GETS' do
  it "should read a line from standard input" do
    Kernel.should_receive :gets
    GETS[]
  end
end

describe 'INTERACT' do
  it "should interact with user input" do
    STDOUT.should_receive(:write).with('Ruby')
    PRINT['Ruby']
  end
end
