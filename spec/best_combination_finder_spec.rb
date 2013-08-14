require "spec_helper"


describe "BestCombinationFinder" do
  let(:quality_measure) { lambda {|arr| arr.from_scala.inject(0, :+).to_f }}
  subject(:finder) { Java::OrgAlgorithmsFast::BestCombinationFinder.new(quality_measure) }

  it "should be instantiable" do
    expect { subject }.to_not raise_exception
  end

  describe "#combinations(elements)" do
    let(:combinations) { finder.combinations(elements.to_scala) }
    let(:best_combinations) { combinations.best.from_scala }
    let(:all_combinations) { combinations.all.from_scala }
    context "for empty elements" do
      let(:elements) { [] }
      it { all_combinations.should == [[]] }
      it { best_combinations.should == [] }
    end

    context "for a single level of elements" do
      let(:elements) { [[1,2]] }
      it "should return the best element according to the quality" do
        best_combinations.should == [2]
      end
    end

    context "for a multiple level of elements" do
      let(:elements) { [[1,2],[3,4]] }
      it "should return the best element according to the quality" do
        best_combinations.should == [2,4]
      end
    end

  end
end