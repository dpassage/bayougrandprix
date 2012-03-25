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
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    it "should show the new driver template" do
      get 'new'
      response.should render_template("new")
    end
  end
  describe "GET show" do
    before(:each) do
      @driver = Driver.create! :name => "Hank", 
                               :player => stub_model(Player, :name => "bob")
    end
    it "should be successful for a real driver" do
      get 'show', :id => @driver.id
      response.should be_success
    end
    it "should render the show template" do
      get 'show', :id => @driver.id
      response.should render_template("show")
    end
    it "should pass the driver to the template" do
      get 'show', :id => @driver.id
      assigns[:driver].should == @driver
    end
  end
end
