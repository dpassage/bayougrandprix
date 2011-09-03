require 'spec_helper'

describe "ScoringScheme" do
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
    end
  end
end
