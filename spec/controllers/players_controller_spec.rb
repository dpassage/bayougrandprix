require 'spec_helper'

describe PlayersController do
  describe "GET index" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    it "should render the index template" do
      get 'index'
      response.should render_template("index")
    end
    it "should pass an array of players" do
      get 'index'
      assigns[:players].should_not == nil
    end
  end
  describe "GET 'new'" do
    it_should_behave_like "standard new CRUD", :player
  end
end
