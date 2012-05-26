require 'spec_helper'

describe Team do
  before(:each) do
    @team = Team.new(:name => "McLaren", :color => Team::Colors["Blue"])
  end
  it "is valid with valid parameters" do
    @team.should be_valid
  end
  it "is not valid without a name" do
    @team.name = nil
    @team.should_not be_valid
  end
  it "is not valid without a color" do
    @team.color = nil
    @team.should_not be_valid
  end
  it "is not valid with an invalid color" do
    @team.color = "This isn't an HTML color code"
    @team.should_not be_valid
  end
  it "has a hash of valid colors" do
    Team::Colors.should_not == nil
    Team::Colors["Blue"].should_not == nil
  end
  it "is not fake by default" do
    @team.fake.should_not == true
  end
  it "is not valid if fake is not set" do
    @team.fake = nil
    @team.should_not be_valid
  end
  describe "#destroy" do
    let (:team) { FactoryGirl.create(:team) }
    let (:otherteam) { FactoryGirl.create(:team)}
    let (:season) { FactoryGirl.create(:season) }
    let (:driver) { FactoryGirl.create(:driver) }
    let (:race) { FactoryGirl.create(:race) }
    it "cannot be removed if used in a season entry" do
      se = SeasonEntry.create!({ defaultteam: team, season: season, driver: driver }, :without_protection => true)
      expect {
        team.destroy
      }.to raise_error
    end
    it "cannot be removed if used in a race entry" do
      se = SeasonEntry.create!({ defaultteam: team, season: season, driver: driver }, :without_protection => true)
      re = RaceEntry.create!( { race: race, season_entry: se, team: otherteam}, :without_protection => true)
      expect {
        otherteam.destroy
      }.to raise_error
    end
  end
end

