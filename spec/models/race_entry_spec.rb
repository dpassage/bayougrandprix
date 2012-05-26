require 'spec_helper'

describe RaceEntry do
  before(:each) do
    @re = RaceEntry.new(
      :race => mock_model("Race"),
      :season_entry => mock_model("SeasonEntry"),
      :team => mock_model("Team")
    )
  end
  it "is valid with valid parameters" do
    @re.should be_valid
  end
  it "is invalid without a race" do
    @re.race = nil
    @re.should_not be_valid
  end
  it "is invalid without a season entry" do
    @re.season_entry = nil
    @re.should_not be_valid
  end
  it "is invalid without a team" do
    @re.team = nil
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
      it "returns 0 without asking the race if racer did not qualify" do
        @re.qualify = 1
        @re.dnq = true
        race = mock_model('Race')
        race.should_not_receive(:points_for_finishing)
        @re.race = race
        @re.qualifying_points.should == 0
      end
    end
  end
end
