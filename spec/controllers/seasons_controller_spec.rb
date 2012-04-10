require 'spec_helper'

describe SeasonsController do
  def user_is_admin
    @request.session[:role] = "admin"
  end

  def user_is_guest
    @request.session[:role] = "guest"
  end
  
  describe "POST create" do
    let(:name) { "2035" }
    let(:scoringscheme) { mock_model('ScoringScheme') }
    let(:season) { mock_model('Season').as_null_object }
    context "when user is admin" do
      before (:each) do
        user_is_admin
        Season.stub(:new).and_return(season)
        ScoringScheme.stub(:find).and_return(scoringscheme)
      end
      it "creates a new season" do
        Season.should_receive(:new).with(:name => name, 
                                         :scoring_scheme => scoringscheme )
                                   .and_return(season)
        post :create, :season => { "name" => "2035", "scoring_scheme" => scoringscheme }
      end
      it "saves the season" do
        season.should_receive(:save)
        post :create, :season => { "name" => "2035", "scoring_scheme" => scoringscheme }
      end      
      it "redirects to index" do
        post :create, :season => { "name" => "2035", "scoring_scheme" => scoringscheme }
        response.should redirect_to(seasons_path)
      end
    end
  end
  describe "GET show" do
    before(:each) do 
      @season = mock_model('Season').as_null_object
      Season.stub(:where).and_return( [ @season ] ) 
    end
    shared_examples "always passes some variables" do
      it "should pass an array of season entries" do
        @season.should_receive(:season_entries).and_return( [ ] )
        get 'show'
        assigns[:season_entries].should_not == nil
      end
      it "should pass a list of races in the season" do
        @season.should_receive(:races).and_return ( [ ] )
        get 'show'
        assigns[:races].should_not == nil
      end      
    end
    context "when the user is an admin" do
      before (:each) { user_is_admin }
      include_examples "always passes some variables"
      it "should pass an array of drivers" do
        Driver.should_receive(:order).and_return ( [ ] )
        get 'show'
        assigns[:drivers].should_not == nil
      end
      it "should pass a list of all tracks" do
        Track.should_receive(:all).and_return ( [ ] )
        get 'show'
        assigns[:tracks].should_not == nil
      end
    end
    context "when the user is not an admin" do
      before (:each) { user_is_guest }
      include_examples "always passes some variables"
      it "should not pass an array of drivers" do
        get 'show'
        assigns[:drivers].should be_nil
      end
      it "should not pass a list of all tracks" do
        get 'show'
        assigns[:tracks].should be_nil
      end
    end
  end
  describe "POST add_driver" do
    context "when the user is an admin" do
      let(:season) { FactoryGirl.create(:season) }
      let(:driver) { FactoryGirl.create(:driver) }
      let(:team) { FactoryGirl.create(:team) }
      before(:each) { user_is_admin }
      it "asks the season to add a driver and team" do
        season.should_receive(:add_driver).with(driver, team)
        Season.should_receive(:find).with(season.id.to_s).and_return(season)
        post 'add_driver',  :season_id => season.id, 
                            :season_entry => { :driver_id => driver.id,
                                               :defaultteam_id => team.id }
                                                               
      end
      context "with an unused driver" do
        it "sets the notice flash" do
          post 'add_driver',  :season_id => season.id, 
                              :season_entry => { :driver_id => driver.id,
                                                 :defaultteam_id => team.id }
          flash[:notice].should_not be_nil
        end
        it "redirects to the season again" do
          post 'add_driver',  :season_id => season.id, 
                              :season_entry => { :driver_id => driver.id,
                                                 :defaultteam_id => team.id }
          response.should redirect_to(season_path(season))
        end
      end
      context "with a driver who's already in the season" do
        before(:each) { season.add_driver(driver, team) }
        it "sets the error flash" do
          post 'add_driver',  :season_id => season.id, 
                              :season_entry => { :driver_id => driver.id,
                                                 :defaultteam_id => team.id }
          flash[:error].should_not be_nil
        end
        it "redirects to the season again" do
          post 'add_driver',  :season_id => season.id, 
                              :season_entry => { :driver_id => driver.id,
                                                 :defaultteam_id => team.id }
          response.should redirect_to(season_path(season))
        end
      end
    end
  end
end
