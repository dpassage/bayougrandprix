require 'spec_helper'
# Processing by RacesController#create as HTML
#   Parameters: {"utf8"=>"✓", 
#     "authenticity_token"=>"ukzMw26fDREoMvVYpPKXt2zvtU2UU2b3+6PHNy986/k=", 
#     "season_id"=>"2011", "date"=>{"year"=>"2012", "month"=>"4", "day"=>"10"}, 
#     "race"=>{"track_id"=>"33"}, "commit"=>"Add Race"}
# Completed 500 Internal Server Error in 3ms


describe RacesController do
  let (:season) { FactoryGirl.create(:season) }
  let (:track) { FactoryGirl.create (:track) }
  let (:race_params) {
    { :season_id => season.to_param,
      :race => {
        "date(1i)" => "2012",
        "date(2i)" => "4",
        "date(3i)" => "11",
        "track_id" => track.id
    } }
  }
  describe "POST 'create'" do
    it "adds a race to the season" do
      before = season.races.all.length
      post 'create', race_params
      season.races.all.length.should == before + 1
    end
    it "redirects to the season page" do
      post 'create', race_params
      response.should redirect_to(season_path(season))
    end
    it "sets the flash notice" do
      post 'create', race_params
      flash[:notice].should_not be_nil
    end
  end
  describe "GET 'destroy'" do
    it "removes the race from the season"
    it "redirects to the season page"
    it "sets the flash notice"
  end
end
