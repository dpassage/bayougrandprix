require 'spec_helper'

describe Race do
  let(:track) { FactoryGirl.create(:track) }
  let(:season) { FactoryGirl.create(:season) }
  before(:each) do
    @race = Race.new(
      :track_id => track.id,
      :season_id => season.id,
      :date => Date.today,
      :writeup => "This is a writeup")
  end
  it "is valid with valid parameters" do
    @race.should be_valid
  end
  it "is invalid without a season" do
    @race.season_id = nil
    @race.should_not be_valid
  end
  it "is invalid without a track" do
    @race.track_id = nil
    @race.should_not be_valid
  end
  it "is invalid without a date" do
    @race.date = nil
    @race.should_not be_valid
  end
  it "is valid without a writeup" do
    @race.writeup = nil
    @race.should be_valid
  end
  describe "#destroy" do
    let (:race) { FactoryGirl.create(:race) }
    let (:season_entry) { FactoryGirl.create(:season_entry) }
    let (:team) { FactoryGirl.create(:team) }
    it "cannot be destroyed if someone has entered the race" do
      re = RaceEntry.create!({ race: race, season_entry: season_entry, team: team }, :without_protection => true)
      expect {
        race.destroy
      }.to raise_error
    end
  end
  describe "#points_for_finishing" do
    it "asks the season what the place is worth" do
      season = mock_model('Season')
      season.should_receive(:points_for_finishing).with(1).and_return(9)
      @race.season = season
      @race.points_for_finishing(1).should == 9
    end
  end
end
