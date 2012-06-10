require 'spec_helper'

describe RaceEntriesController do
  let (:season) { FactoryGirl.create(:season) }
  let (:race) { FactoryGirl.create(:race, season: season) }
  let (:season_entry) { FactoryGirl.create(:season_entry, season: season) }
  let (:team) { FactoryGirl.create(:team) }
  let (:race_entry_params) {
    { "race_entry" => { :season_entry_id => season_entry.to_param,
      :race_id => race.to_param,
      :team_id => team.to_param
    } }
  }

  describe "POST 'create'" do
    context "when the user is not an admin" do
      before(:each) do
        user_is_guest
      end
      it_should_behave_like "an unauthorized operation" do
        before(:each) do
          post 'create', race_entry_params
        end
      end
      it "does not create the race entry" do
        expect {
          post 'create', race_entry_params
         }.to change(RaceEntry,:count).by(0)
      end
    end
    context "when the user is an admin" do
      before(:each) do
        user_is_admin
      end      
      it "adds a driver to the race" do
        expect {
          post 'create', race_entry_params
        }.to change(RaceEntry,:count).by(1)
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
end
