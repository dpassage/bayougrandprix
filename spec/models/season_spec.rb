require 'spec_helper'

describe "Season" do
  fixtures :all
  let(:ss) { FactoryGirl.create(:scoring_scheme) }
  before(:each) do
    @season = Season.new(
      :scoring_scheme_id => ss.to_param,
      :name => "1999"
    )
  end
  it "is valid with valid parameters" do
    @season.should be_valid
  end
  it "is not valid without a name" do
    @season.name = nil
    @season.should_not be_valid
  end
  it "is not valid without a scoring scheme" do
    @season.scoring_scheme_id = nil
    @season.should_not be_valid
  end
  it "is not valid if the scoring scheme id does not exist" do
    invalid_id = ScoringScheme.maximum("id") + 1
    @season.scoring_scheme_id = invalid_id
    @season.should_not be_valid
  end
  describe "#destroy" do
    let (:season) { FactoryGirl.create(:season) }
    let (:track) { FactoryGirl.create(:track) }
    let (:team) { FactoryGirl.create(:team) }
    let (:driver) { FactoryGirl.create(:driver)}
    it "cannot be removed if there are races in the season" do
      race = Race.create!({track: track, season: season, date:Time.new }, :without_protection => true)
      expect {
        season.destroy
      }.to raise_error
    end
    it "cannot be removed if there are drivers entered in the season" do
      de = DriverEntry.create!({ defaultteam: team, season: season, driver: driver }, :without_protection => true)
      expect {
        season.destroy
      }.to raise_error
    end
  end
  describe "#drivers_by_points" do
    it "returns an array of driver entries sorted by points scored" do
      season = seasons(:season_2002)
      results = season.drivers_by_points
      results.length.should == 12
      results[0].entrant.should == drivers(:schumacher)
      results[0].points.should == 47
    end
    it "counts number of wins if tied on points" do
      pending
      scheme = FactoryGirl.create(:scoring_scheme, name: "9-6-4-3-2-1")
      season = FactoryGirl.create(:season, scoring_scheme: scheme)
      alice = FactoryGirl.create(:driver, name: "alice")
      bob = FactoryGirl.create(:driver, name: "bob")
      bob_se = FactoryGirl.create(:driver_entry, season: season, driver: bob)
      alice_se = FactoryGirl.create(:driver_entry, season: season, driver: alice)
      race1 = FactoryGirl.create(:race, season: season)
      FactoryGirl.create(:race_entry, race: race1, driver_entry: alice_se, finish: 1)
      FactoryGirl.create(:race_entry, race: race1, driver_entry: bob_se,   finish: 2)
      race2 = FactoryGirl.create(:race, season: season)
      FactoryGirl.create(:race_entry, race: race2, driver_entry: alice_se, finish: 10)
      FactoryGirl.create(:race_entry, race: race2, driver_entry: bob_se,   finish: 4)

      results = season.drivers_by_points
      results.length.should == 2
      results[0].entrant.id.should == alice.id
      results[1].entrant.id.should == bob.id
    end
  end
  describe "#to_param" do
    it "returns its name" do
      @season.to_param.should == @season.name
    end
  end
  describe "#teams_by_points" do
    it "returns an array of team entries sorted by points scored" do
      season = seasons(:season_2002)
      results = season.teams_by_points
      results.length.should == 5
      results[0].entrant.should == teams(:mclaren)
      results[0].points.should == 85
    end
  end
  describe "#drivers_by_qualifying_points" do
    it "returns an array of driver entries by qualifying points" do
      season = seasons(:season_2002)
      results = season.drivers_by_qualifying_points
      results.length.should == 12
      results[0].entrant.should == drivers(:schumacher)
      results[0].points.should == 67
    end
  end
  describe "#points_for_finishing" do
    it "asks the scoring scheme what the place is worth" do
      @season = Season.new
      scheme = mock_model('ScoringScheme')
      scheme.should_receive(:points_for_finishing).with(1).and_return(9)
      @season.scoring_scheme = scheme
      @season.points_for_finishing(1).should == 9
    end
  end
end
