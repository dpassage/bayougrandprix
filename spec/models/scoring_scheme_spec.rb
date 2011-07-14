require 'spec_helper'

describe "ScoringScheme" do
  describe "#points_for_finishing" do
    context "with a scheme named 9-6-4-3-2-1" do
      it "returns 9 for 1st"
      it "returns 6 for 2nd"
      it "returns 4 for 3rd"
      it "returns 3 for 4th"
      it "returns 2 for 5th"
      it "returns 1 for 6th"
      it "returns 0 for 7th"
    end
  end
end
