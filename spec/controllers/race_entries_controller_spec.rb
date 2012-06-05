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
    context "when the user is not an admin" do
      before(:each) do
        controller.stub(:admin?).and_return(false)
      end
      it "redirects to the root path" do
        post 'create', race_entry_params
        response.should redirect_to(root_path)
      end
      it "sets the error flash" do
        post 'create', race_entry_params
        flash[:error].should_not be_nil
      end
     it "does not create the race entry" do
       before = race.race_entries.all.length
       post 'create', race_entry_params
       race.race_entries.all.length.should == before
     end
    end
    context "when the user is an admin" do
      before(:each) do
        controller.stub(:admin?).and_return(true)
      end      
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
end
