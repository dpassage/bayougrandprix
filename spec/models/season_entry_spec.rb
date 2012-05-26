require 'spec_helper'

describe SeasonEntry do
  before (:each) do
    @se = SeasonEntry.new(
      { :season => mock_model("Season"),
      :defaultteam => mock_model("Team"),
      :driver => mock_model("Driver") },
      :without_protection => true
    )
  end
  it "is valid with valid parameters" do
    @se.should be_valid
  end
  it "is invalid without a season" do
    @se.season = nil
    @se.should_not be_valid
  end
  it "is invalid without a default team" do
    @se.defaultteam = nil
    @se.should_not be_valid
  end
  it "is invalid without a driver" do
    @se.driver = nil
    @se.should_not be_valid
  end
  describe "#destroy" do
    let (:season) { FactoryGirl.create(:season) }
    let (:race) { FactoryGirl.create(:race) }
    let (:season_entry) { FactoryGirl.create(:season_entry) }
    let (:team) { FactoryGirl.create(:team) }
    it "cannot be deleted if the driver has participated in a race that season" do
      re = RaceEntry.create!( { race: race, season_entry: season_entry, team: team}, :without_protection => true)
      expect {
        season_entry.destroy
      }.to raise_error
    end
  end
end
