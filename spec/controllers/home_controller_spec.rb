require 'spec_helper'

describe HomeController do
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    it "should render the index template" do
      get 'index'
      response.should render_template("index")
    end
    it "should pass an array of seasons" do
      get 'index'
      assigns[:seasons].should_not == nil
    end
    context "when there are three seasons" do
      before(:each) do
        scheme = ScoringScheme.create!(:name => "2-1")
        Season.create!(:name => "2001", :scoring_scheme => scheme)
        Season.create!(:name => "2011", :scoring_scheme => scheme)
        Season.create!(:name => "2003", :scoring_scheme => scheme)
      end
      it "should pass all the seasons in the array" do
        get 'index'
        assigns[:seasons].length.should == 3
      end
      it "should pass an array sorted by name" do
        get 'index'
        assigns[:seasons][0].name.should == "2001"
        assigns[:seasons][1].name.should == "2003"
        assigns[:seasons][2].name.should == "2011"
      end
    end
  end
end
