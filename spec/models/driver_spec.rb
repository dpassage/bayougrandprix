require 'spec_helper'

describe Driver do
  describe "#destroy" do
    let (:season) { FactoryGirl.create(:season) }
    let (:driver) { FactoryGirl.create(:driver) }
    it "cannot be removed if the driver has entered a season" do
      se = FactoryGirl.create(:season_entry, driver: driver, season: season)
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
      scheme = ScoringScheme.create!(:name => "2-1")
      season = Season.create!(:name => "1973", :scoring_scheme => scheme)
      player = Player.create!(:name => "David")
      driver = Driver.create!(:name => "David", :player => player)
      team = Team.create!(:name => "Mclaren", :color => Team::Colors["Blue"])
      season_entry = SeasonEntry.create!( 
        { :season => season,
          :driver => driver,
          :defaultteam => team },
        :without_protection => true
      )
      driver.default_team_for_season(season).should == team
    end
  end
end
