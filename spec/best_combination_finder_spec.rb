require "spec_helper"


describe "BestCombinationFinder" do
  let(:quality_measure) { lambda {|x| x }}
  subject(:finder) { BestCombinationFinder.new(quality_measure) }
  it "should be instantiable" do
    expect { subject }.to_not raise_exception
  end
  describe "#find_combinations" do
    subject(:combinations) { finder.combinations(elements) }
    context "for empty elements" do
      let(:elements) { [] }
      it { should == [] }
    end
    context "for a single level of elements" do
      let(:elements) { [[1,2,3]] }
      it "should return the best element according to the quality" do
        should == [3]
      end
    end
    context "for a multiple level of elements" do
      let(:elements) { [[1,2,3],[4,5,6]] }
      it "should return the best element according to the quality" do
        should == [3,6]
      end
    end

  end
end