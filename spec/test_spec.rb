require "spec_helper"

describe "Test" do
  it "should be instantiable" do
    Java::OrgAlgorithmsFast::Test.new
  end
  it "should react" do
    expect(org.algorithms.fast.Test.new.foo).to eq("foo")
  end
end