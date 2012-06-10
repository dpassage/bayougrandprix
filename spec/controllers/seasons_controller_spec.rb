require 'spec_helper'

describe SeasonsController do
  def user_is_admin
    controller.stub(:admin?).and_return(true)
  end

  def user_is_guest
    controller.stub(:admin?).and_return(false)
  end
  
  describe "POST create" do
    let(:name) { "2035" }
    let(:ss) { FactoryGirl.create(:scoring_scheme) }
    let(:create_params) { { "season" => { "name" => name, "scoring_scheme_id" => ss.to_param } } }
    context "when the user is not an admin" do
      before (:each) do 
        user_is_guest
      end
      it_should_behave_like "an unauthorized operation" do
        before (:each) do
          post :create, create_params
        end
      end
    end
    context "when user is admin" do
      before (:each) do
        user_is_admin
      end
      context "with valid params" do
        it "creates a new season" do
          expect {
            post :create, create_params
          }.to change(Season, :count).by(1)
        end
        it "redirects to index" do
          post :create, create_params
          response.should redirect_to(seasons_path)
        end
      end
      context "with invalid name" do
        let(:invalid_params) { { "season" => { "name" => nil, "scoring_scheme_id" => ss.to_param } } }
        it "does not create a new season" do
          expect {
            post :create, invalid_params
          }.to change(Season, :count).by(0)
        end
        # it "sets the error flash" do
        #   post :create, invalid_params
        #   flash[:error].should_not be_nil
        # end
        it "renders the new page" do
          post :create, invalid_params
          response.should render_template("new")
        end
      end
      # context "with invalid scheme" do
      #   let(:invalid_params) { { "season" => { "name" => "name", "scoring_scheme_id" => ss.to_param + "4" } } }
      #   it "does not create a new season" do
      #     expect {
      #       post :create, invalid_params
      #     }.to change(Season, :count).by(0)
      #   end
      #   it "sets the error flash" do
      #     post :create, invalid_params
      #     flash[:error].should_not be_nil
      #   end
      #   it "renders the new page" do
      #     post :create, invalid_params
      #     response.should render_template("new")
      #   end
      # end
    end
  end
  describe "GET show" do
    let(:season) { FactoryGirl.create(:season) }
    let(:show_params) { { id: season.to_param } }
    shared_examples "always passes some variables" do
      it "should pass an array of season entries" do
        get 'show', show_params
        assigns[:season_entries].should_not == nil
      end
      it "should pass a list of races in the season" do
        get 'show', show_params
        assigns[:races].should_not == nil
      end      
    end
    context "when the user is an admin" do
      before (:each) { user_is_admin }
      include_examples "always passes some variables"
      it "should pass an array of drivers" do
        get 'show', show_params
        assigns[:drivers].should_not == nil
      end
      it "should pass a list of all tracks" do
        get 'show', show_params
        assigns[:tracks].should_not == nil
      end
    end
    context "when the user is not an admin" do
      before (:each) { user_is_guest }
      include_examples "always passes some variables"
      it "should not pass an array of drivers" do
        get 'show', show_params
        assigns[:drivers].should be_nil
      end
      it "should not pass a list of all tracks" do
        get 'show', show_params
        assigns[:tracks].should be_nil
      end
    end
  end
  describe "GET results" do
    let(:season) { FactoryGirl.create(:season) }
    let(:results_params) { { "id" => season.to_param } }
    it "passes the season to the view" do
      get 'results', results_params
      assigns[:season].should == season
    end
    it "passes drivers by points to the view" do
      get 'results', results_params
      assigns[:drivers_by_points].should_not be_nil
    end
    it "passes teams by points to the view" do
      get 'results', results_params
      assigns[:teams_by_points].should_not be_nil
    end
    it "passes drivers by qualifying points to the view" do
      get 'results', results_params
      assigns[:drivers_by_qualifying_points].should_not be_nil
    end
  end
  describe "GET 'new'" do
    it_should_behave_like "standard new CRUD", :season
  end
  describe "GET index" do
    it_should_behave_like "standard index CRUD", :seasons
  end
end
