require 'spec_helper'

describe SeasonEntry do
  let(:season) { FactoryGirl.create(:season) }
  let(:team) { FactoryGirl.create(:team) }
  let(:driver) { FactoryGirl.create(:driver) }
  before (:each) do
    @se = SeasonEntry.new(
      :season_id => season.id,
      :defaultteam_id => team.id,
      :driver_id => driver.id)
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
    let (:race) { FactoryGirl.create(:race) }
    let (:season_entry) { FactoryGirl.create(:season_entry) }
    it "cannot be deleted if the driver has participated in a race that season" do
      re = RaceEntry.create!( { race: race, season_entry: season_entry, team: team}, :without_protection => true)
      expect {
        season_entry.destroy
      }.to raise_error
    end
  end
  describe "#finish_points" do
    it "returns 0 when the driver has not been entered into a race" do
      @se.finish_points.should == 0
    end
    it "asks each race entry how many points it's worth" do
      # create an array of 2 mock race entries; they should receive finish_points
      re1 = stub_model(RaceEntry)
      re1.should_receive(:finish_points).and_return(1)
      re2 = stub_model(RaceEntry)
      re2.should_receive(:finish_points).and_return(1)
      race_entries = [ re1, re2 ]
      # stub season_entry.race_entries to return this array
      @se.stub(:race_entries).and_return(race_entries)
      # call the finish_points function
      @se.finish_points
    end
  end
end
