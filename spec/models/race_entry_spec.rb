require 'spec_helper'

describe RaceEntry do
  before(:each) do
    @re = RaceEntry.new(
      :race => mock_model("Race"),
      :driver => mock_model("Driver")
    )
  end
  it "is valid with valid parameters" do
    @re.should be_valid
  end
  it "is invalid without a race" do
    @re.race = nil
    @re.should_not be_valid
  end
  it "is invalid without a driver" do
    @re.driver = nil
    @re.should_not be_valid
  end
  it "initially is nil for finishing place" do
    @re.finish.should be_nil
  end
  it "initially is nil for qualifying place" do
    @re.qualify.should be_nil
  end
  describe "knows how to compute points for finishes" do
    describe "#finish_points" do
      it "asks the race what the place is worth" do
        @re.finish = 1
        race = mock_model('Race')
        race.should_receive(:points_for_finishing).with(1).and_return(9)
        @re.race = race
        @re.finish_points.should == 9
      end
    end
    describe "#qualifying_points" do
      it "asks the race what the place is worth" do
        @re.qualify = 1
        @re.dnq = false
        race = mock_model('Race')
        race.should_receive(:points_for_finishing).with(1).and_return(9)
        @re.race = race
        @re.qualifying_points.should == 9
      end
    end
  end
end
