require 'spec_helper'

describe RaceEntriesController do
  let (:race) { FactoryGirl.create(:race) }
  let (:season_entry) { FactoryGirl.create (:season_entry) }
  let (:team) { FactoryGirl.create(:team) }
  let (:race_entry_params) {
    { :season_entry_id => season_entry.to_param,
      :race_id => race.to_param,
      :team_id => team.to_param
    }
  }
  describe "POST 'create'" do
    it "adds a driver to the race" do
      before = race.race_entries.all.length
      post 'create', race_entry_params
      race.race_entries.all.length.should == before + 1
    end
    it "redirects to the race page" do
      post 'create', race_entry_params
      response.should redirect_to(season_race_path(season_entry.season, race))
    end
    it "sets the flash notice" do
      post 'create', race_entry_params
      flash[:notice].should_not be_nil
    end
  end
end
