require 'spec_helper'

shared_examples "standard new CRUD" do 
  it "should be successful" do
    get 'new'
    response.should be_success
  end
  it "should show the new driver template" do
    get 'new'
    response.should render_template("new")
  end
  it "passes a new, unsaved object to the view"
end
