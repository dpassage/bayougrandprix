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
    it "should pass an array of drivers" do
      get 'index'
      assigns[:drivers].should_not == nil
    end
  end
  describe "GET new" do
    it_should_behave_like "standard new CRUD", :driver
  end
  describe "GET show" do
    let(:driver) { FactoryGirl.create(:driver) }
    it "should be successful for a real driver" do
      get 'show', :id => driver.to_param
      response.should be_success
    end
    it "should render the show template" do
      get 'show', :id => driver.to_param
      response.should render_template("show")
    end
    it "should pass the driver to the template" do
      get 'show', :id => driver.to_param
      assigns[:driver].should == driver
    end
  end
end
