require 'spec_helper'

shared_examples "standard new CRUD" do |model_name|
  it "should be successful" do
    get 'new'
    response.should be_success
  end
  it "should show the new driver template" do
    get 'new'
    response.should render_template("new")
  end
  it "passes a new, unsaved object to the view" do
    get 'new'
    assigns[model_name].should_not be_nil
    assigns[model_name].should be_new_record
  end
end

shared_examples "standard index CRUD" do |model_name_plural|
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
    assigns[model_name_plural].should_not == nil
  end
end
