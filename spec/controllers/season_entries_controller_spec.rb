require 'spec_helper'

describe SeasonEntriesController do
  describe "POST create" do
    let(:season) { FactoryGirl.create(:season) }
    let(:driver) { FactoryGirl.create(:driver) }
    let(:team) { FactoryGirl.create(:team) }
    let(:post_params) { { "season_id" => season.to_param,
                          "season_entry" => {
                            "driver_id" => driver.id.to_s,
                            "defaultteam_id" => team.id.to_s } } }
    context "with an unused driver" do
      it "creates a new season_entry" do
        season.season_entries.all.length.should == 0
        post 'create', post_params
        season.season_entries.all.length.should == 1
      end
      it "sets the notice flash" do
        post 'create', post_params
        flash[:notice].should_not be_nil
      end
      it "does not set the error flash" do
        post 'create', post_params
        flash[:error].should be_nil
      end
      it "redirects to the season" do
        post 'create', post_params
        response.should redirect_to(season_path(season))
      end
    end
    context "with a used driver" do
      before(:each) { SeasonEntry.create({ :season => season,
                                           :driver => driver,
                                           :defaultteam => team},
                                           :without_protection => true) }
      it "does not create a new season_entry" do
        before_entries = season.season_entries.all.length
        post 'create', post_params
        season.season_entries.all.length.should == before_entries
      end
      it "sets the error flash" do
        post 'create', post_params
        flash[:error].should_not be_nil
      end
      it "redirects to the season" do
        post 'create', post_params
        response.should redirect_to(season_path(season))
      end
    end
  end
  describe "DELETE destroy" do
    let(:season) { FactoryGirl.create(:season) }
    let(:season_entry) { FactoryGirl.create(:season_entry, { :season => season }) }
    it "removes the season entry" do
      delete 'destroy', { :id => season_entry.id,
                          :season_id => season.to_param }
      expect { 
        SeasonEntry.find(season_entry.id)
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
    it "does not set the error flash" do
      delete 'destroy', { :id => season_entry.id,
                          :season_id => season.to_param }
      flash[:error].should be_nil
    end
    it "redirects to the season" do
      delete 'destroy', { :id => season_entry.id,
                          :season_id => season.to_param }
      response.should redirect_to(season_path(season))
    end
      
  end

end
