require 'spec_helper'

describe DriversController do
  let(:driver) { FactoryGirl.create(:driver) }
  describe "GET index" do
    it_should_behave_like "standard index CRUD", :drivers
  end
  describe "GET new" do
    it_should_behave_like "standard new CRUD", :driver
  end
  describe "GET show" do
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
  describe "GET 'edit'" do
    before(:each) do
      get 'edit', { "id" => driver.to_param }
    end
    it ("should be successful") { response.should be_success }
    it ("should render the edit template") {
      response.should render_template("edit") }
    it ("should pass the team") { assigns[:driver].should == driver }
  end
  describe "POST 'update'" do
    let (:update_params) { { "id"=> driver.to_param,
                             "driver"=>{"name"=>"Foo!" } } }
    context "the user is not an admin" do
      before(:each) do
        user_is_guest
      end
      it_should_behave_like "an unauthorized operation" do
        before(:each) do
          post 'update', update_params
        end
      end
      it ("should not change the team") do
        post 'update', update_params
        Driver.find(update_params["id"]).name.should_not == "Foo!"
      end
    end
    context "the user is an admin" do
      before(:each) { user_is_admin }
      context "with valid params" do
        before(:each) { post 'update', update_params }
        it("should redirect to the drivers list") {
          response.should redirect_to(drivers_path) }
        it("should change the team name") {
          Driver.find(update_params["id"]).name.should == "Foo!" }
        it("should set the notice flash") { flash[:notice].should_not be_nil }
      end
    end
  end
end
