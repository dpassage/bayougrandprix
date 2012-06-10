require "spec_helper"

describe ScoringSchemesController do
  describe "routing" do

    it "routes to #index" do
      get("/scoring_schemes").should route_to("scoring_schemes#index")
    end

    it "routes to #new" do
      get("/scoring_schemes/new").should route_to("scoring_schemes#new")
    end
        
    it "routes to #create" do
      post("/scoring_schemes").should route_to("scoring_schemes#create")
    end
    
    it "routes to #destroy" do
      delete("/scoring_schemes/1").should route_to("scoring_schemes#destroy", :id => "1")
    end
    
  end
end
