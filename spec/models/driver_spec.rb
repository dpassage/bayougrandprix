require 'spec_helper'

describe Driver do
  let(:player) { FactoryGirl.create(:player) }
  before(:each) do
    @driver = Driver.new(
      :player_id => player.to_param,
      :name => "1999"
    )
  end
  it "is valid with valid parameters" do
    @driver.should be_valid
  end
  it "is not valid without a name" do
    @driver.name = nil
    @driver.should_not be_valid
  end
  it "is not valid without a player" do
    @driver.player_id = nil
    @driver.should_not be_valid
  end
  it "is not valid if the player id does not exist" do
    invalid_id = Player.maximum("id") + 1
    @driver.player_id = invalid_id
    @driver.should_not be_valid
  end
  describe "#destroy" do
    let (:season) { FactoryGirl.create(:season) }
    let (:driver) { FactoryGirl.create(:driver) }
    it "cannot be removed if the driver has entered a season" do
      se = FactoryGirl.create(:driver_entry, driver: driver, season: season)
      expect { driver.destroy }.to raise_error
    end
    it "can be removed if the driver hasn't entered a season" do
      saved_id = driver.id
      driver.destroy
      expect {
        Driver.find(saved_id)
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
  describe "#default_team_for_season" do
    it "returns the default team for that driver in that season" do
      scheme = FactoryGirl.create(:scoring_scheme)
      season = FactoryGirl.create(:season, :scoring_scheme => scheme)
      player = FactoryGirl.create(:player)
      driver = FactoryGirl.create(:driver, :player => player)
      team = FactoryGirl.create(:team)
      driver_entry = FactoryGirl.create(:driver_entry, :season => season,
                                                       :driver => driver,
                                                       :defaultteam => team )
      driver.default_team_for_season(season).should == team
    end
  end
end
