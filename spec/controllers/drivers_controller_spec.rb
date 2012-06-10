require 'spec_helper'

describe DriversController do
  describe "GET index" do
    it_should_behave_like "standard index CRUD", :drivers
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
