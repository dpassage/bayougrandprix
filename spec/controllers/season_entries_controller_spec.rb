require 'spec_helper'

describe SeasonEntriesController do

  describe "DELETE destroy" do
    let(:season) { FactoryGirl.create(:season) }
    let(:season_entry) { FactoryGirl.create(:season_entry, { :season => season }) }
    it "removes the season entry" do
      delete 'destroy', { :id => season_entry.id,
                          :season_id => season.id }
      expect { 
        SeasonEntry.find(season_entry.id)
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
    it "redirects to the season" do
      delete 'destroy', { :id => season_entry.id,
                          :season_id => season.id }
      response.should redirect_to(season_path(season.id))
    end
      
  end

end
