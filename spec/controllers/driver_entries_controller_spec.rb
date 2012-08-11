require 'spec_helper'

describe DriverEntriesController do
  describe "POST create" do
    let(:season) { FactoryGirl.create(:season) }
    let(:driver) { FactoryGirl.create(:driver) }
    let(:team) { FactoryGirl.create(:team) }
    let(:post_params) { { "season_id" => season.to_param,
                          "driver_entry" => {
                            "driver_id" => driver.to_param,
                            "defaultteam_id" => team.to_param } } }
    context "when the user is not an admin" do
      before(:each) do
        user_is_guest
      end
      it_should_behave_like "an unauthorized operation" do
        before(:each) do
          post 'create', post_params
        end
      end
    end
    context "when the user is an admin" do
      before(:each) do
        user_is_admin
      end
      context "with an unused driver" do
        it "creates a new season_entry" do
          expect {
            post 'create', post_params
          }.to change(season.season_entries, :count).by(1)
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
        before(:each) { DriverEntry.create({ :season => season,
                                             :driver => driver,
                                             :defaultteam => team},
                                             :without_protection => true) }
        it "does not create a new driver_entry" do
          before_entries = season.driver_entries.all.length
          post 'create', post_params
          season.driver_entries.all.length.should == before_entries
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
  end
  describe "DELETE destroy" do
    let(:season) { FactoryGirl.create(:season) }
    let(:driver_entry) { FactoryGirl.create(:driver_entry, { :season => season }) }
    let(:delete_params) { { id: driver_entry.to_param, season_id: season.to_param }}
    context "when the user is not an admin" do
      before(:each) do
        user_is_guest
      end
      it_should_behave_like "an unauthorized operation" do
        before(:each) do
          delete 'destroy', delete_params
        end
      end
    end
    context "when the user is an admin" do
      before(:each) do
        user_is_admin
      end
      it "removes the season entry" do
        delete 'destroy', delete_params
        expect { 
          DriverEntry.find(driver_entry.id)
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
      it "does not set the error flash" do
        delete 'destroy', delete_params
        flash[:error].should be_nil
      end
      it "redirects to the season" do
        delete 'destroy', delete_params
        response.should redirect_to(season_path(season))
      end
      context "when the driver has been entered in a race that season" do
        let(:race) { FactoryGirl.create(:race, season: season) }
        before(:each) do
          FactoryGirl.create(:race_entry, 
                             race: race,
                             driver_entry: driver_entry,
                             team: driver_entry.defaultteam) 
        end
        it "does not remove the season entry" do
          delete 'destroy', { :id => driver_entry.id,
                              :season_id => season.to_param }
          DriverEntry.find(driver_entry.id).should == driver_entry
        end
        it "sets the error flash" do
          delete 'destroy', { :id => driver_entry.id,
                              :season_id => season.to_param }
          flash[:error].should_not be_nil
        end
        it "redirects to the season" do
          delete 'destroy', { :id => driver_entry.id,
                              :season_id => season.to_param }
          response.should redirect_to(season_path(season))
        end
      end
    end
  end
end
