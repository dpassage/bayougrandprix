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
  describe "GET 'show'" do
    let (:race) { FactoryGirl.create(:race, :season => season) }
    let (:params) { { "season_id" => season.to_param,
                      "id" => race.to_param } }
    it "passes the race" do
      get 'show', params
      assigns[:race].should == race
    end
    it "passes the season" do
      get 'show', params
      assigns[:season].should == season
    end
  end
  describe "POST 'update'" do
    context "setting the qualifying and finishing" do
      let (:race) { FactoryGirl.create(:race) }
      let (:re1) { FactoryGirl.create(:race_entry, race: race) }
      let (:re2) { FactoryGirl.create(:race_entry, race: race) }
      let (:re3) { FactoryGirl.create(:race_entry, race: race) }
      context "finishing places are unique" do
        let (:params) { { "race" => 
                          { "race_entries_attributes" =>
                            { "0"=>{"finish"=>"1", "qualify"=>"3", "id"=> re1.to_param}, 
                              "1"=>{"finish"=>"2", "qualify"=>"2", "id"=> re2.to_param}, 
                              "2"=>{"finish"=>"3", "qualify"=>"1", "id"=> re3.to_param}, 
                            }
                          }, 
                          "commit" => "Update", 
                          "season_id" => race.season.to_param, 
                          "id" => race.to_param 
                        } 
                      }
        it "updates the dependent race entries with the new data" do
          post 'update', params
          RaceEntry.find(re1.id).finish.should == 1
          RaceEntry.find(re2.id).finish.should == 2
          RaceEntry.find(re3.id).finish.should == 3
          RaceEntry.find(re1.id).qualify.should == 3
          RaceEntry.find(re2.id).qualify.should == 2
          RaceEntry.find(re3.id).qualify.should == 1
        end
        it "sets the flash notice" do
          post 'update', params
          flash[:notice].should_not be_nil
        end
        it "redirects to the race page" do
          post 'update', params
          response.should redirect_to(season_race_path(race.season, race))
        end
      end
      context "finishing places conflict" do
        let (:params) { { "race" => 
                          { "race_entries_attributes" =>
                            { "0"=>{"finish"=>"1", "qualify"=>"3", "id"=> re1.to_param}, 
                              "1"=>{"finish"=>"1", "qualify"=>"2", "id"=> re2.to_param}, 
                            }
                          }, 
                          "commit" => "Update", 
                          "season_id" => race.season.to_param, 
                          "id" => race.to_param 
                        } 
                      }
        it "does not change the race entries" do
          post 'update', params
          myre1 =  RaceEntry.find(re1.id)
          myre2 =  RaceEntry.find(re2.id)
          myre1.finish.should be_nil
          myre2.finish.should be_nil
        end
        it "sets the flash error" do
          post 'update', params
          flash[:error].should_not be_nil
        end
        it "redirects to the race page" do
          post 'update', params
          response.should redirect_to(season_race_path(race.season, race))
        end
      end
    end
  end
end
