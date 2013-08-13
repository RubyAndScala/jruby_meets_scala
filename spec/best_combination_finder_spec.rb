require "spec_helper"


describe "BestCombinationFinder" do
  let(:quality_measure) { lambda {|arr| arr.from_scala.inject(0, :+).to_f }}
  subject(:finder) { Java::OrgAlgorithmsFast::BestCombinationFinder.new(quality_measure) }

  it "should be instantiable" do
    expect { subject }.to_not raise_exception
  end

  describe "#combinations(elements)" do
    subject(:combinations) { finder.combinations(elements.to_scala) }

    context "for empty elements" do
      let(:elements) { [] }
      it { combinations.all.from_scala.should == [[]] }
      it { combinations.best.from_scala.should == [] }
    end

    context "for a single level of elements" do
      let(:elements) { [[1,2]] }
      it "should return the best element according to the quality" do
        combinations.best.from_scala.should == [2]
      end
    end

    context "for a multiple level of elements" do
      let(:elements) { [[1,2],[3,4]] }
      it "should return the best element according to the quality" do
        combinations.best.from_scala.should == [2,4]
      end
    end

  end
end