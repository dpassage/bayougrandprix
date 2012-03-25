require 'spec_helper'

describe DriversController do
  describe "GET index" do
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
      assigns[:drivers].should_not == nil
    end
  end
end
