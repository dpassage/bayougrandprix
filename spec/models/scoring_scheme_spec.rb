require 'spec_helper'

describe "ScoringScheme" do
  before(:each) do
    @ss = ScoringScheme.new(:name => "9-6-4-3-2-1")
  end
  it "is valid with valid parameters" do
    @ss.should be_valid
  end
  it "is not valid without a name" do
    @ss.name = nil
    @ss.should_not be_valid
  end
  it "is not valid if the name is not properly formatted" do
    @ss.name = "This is not a valid scoring scheme name"
    @ss.should_not be_valid
  end
  describe "#destroy" do
    let (:scoring_scheme) { FactoryGirl.create(:scoring_scheme) }
    it "cannot be removed if it's in use in a season" do
      season = Season.create!( { scoring_scheme: scoring_scheme, name: "2037"}, :without_protection => true)
      expect {
        scoring_scheme.destroy
      }.to raise_error
    end
  end
  describe "#points_for_finishing" do
    context "with a scheme named 9-6-4-3-2-1" do
      before(:each) do
        @scheme = ScoringScheme.new(:name => "9-6-4-3-2-1")
      end
      it "returns 9 for 1st" do
        @scheme.points_for_finishing(1).should == 9
      end
      it "returns 6 for 2nd" do
        @scheme.points_for_finishing(2).should == 6
      end
      it "returns 4 for 3rd" do
        @scheme.points_for_finishing(3).should == 4
      end
      it "returns 3 for 4th" do
        @scheme.points_for_finishing(4).should == 3
      end
      it "returns 2 for 5th" do
        @scheme.points_for_finishing(5).should == 2
      end
      it "returns 1 for 6th" do
        @scheme.points_for_finishing(6).should == 1
      end
      it "returns 0 for 7th" do
        @scheme.points_for_finishing(7).should == 0
      end
      it "returns 0 for nil" do
        @scheme.points_for_finishing(nil).should == 0
      end
    end
  end
end
