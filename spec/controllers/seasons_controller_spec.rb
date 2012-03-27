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
      end
      it "creates a new season" do
        Season.should_receive(:new).with("name" => name, 
                                         "scoring_scheme" => scoringscheme.to_param )
                                   .and_return(season)
        post :create, :season => { "name" => "2035", "scoring_scheme" => scoringscheme }
      end
      it "saves the season" do
        season.should_receive(:save)
        post :create, :season => { "name" => "2035", "scoring_scheme" => scoringscheme }
      end      
      it "redirects to index" do
        post :create
        response.should redirect_to(seasons_path)
      end
    end
  end
end