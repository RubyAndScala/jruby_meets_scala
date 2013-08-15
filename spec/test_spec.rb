require "spec_helper"

describe "Test" do
  subject(:algorithm) {
    Java::OrgAlgorithmsFast::Test.new
  }
  it "should be instantiable" do
    expect { algorithm }.to_not raise_exception
  end
  it "should react" do
    expect(algorithm.foo).to eq("foo")
  end
end