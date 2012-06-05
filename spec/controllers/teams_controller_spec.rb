require 'spec_helper'

describe TeamsController do
  let (:team) { FactoryGirl.create(:team) }
  let (:params) { { id: team.to_param } }
  describe "GET index" do
    before(:each) do
      get 'index'
    end
    it ("should be successful") { response.should be_success }
    it ("should render the index template") { response.should render_template("index") }
    it ("should pass an array of teams") { assigns[:teams].should_not == nil }
  end
  describe "GET 'show'" do
    before(:each) do
      get 'show', params
    end
    it ("should be successful") { response.should be_success }
    it ("should render the show template") { response.should render_template("show") }
    it ("should pass the team") { assigns[:team].should == team }
  end
  describe "GET 'edit'" do
    before(:each) do
      get 'edit', params
    end
    it ("should be successful") { response.should be_success }
    it ("should render the edit template") { response.should render_template("edit") }
    it ("should pass the team") { assigns[:team].should == team }
  end
  describe "POST 'update'" do
    let (:update_params) { { "id"=> team.to_param, 
                             "team"=>{"name"=>"Foo!", "color"=>team.color, "fake"=>team.fake } } }
    context "the user is not an admin" do
      before(:each) do
        controller.stub(:admin?).and_return(false)
      end
      it_should_behave_like "an unauthorized operation" do
        before(:each) do
          post 'update', update_params
        end
      end
      it ("should not change the team") do 
        post 'update', update_params
        team.name.should_not == "Foo!"
      end
    end
    context "the user is an admin" do
      before(:each) { controller.stub(:admin?).and_return(true) }
      context "with valid params" do
        before(:each) { post 'update', update_params }
        it("should redirect to the show template") { response.should redirect_to(team_path(team)) }
        it("should change the team name") { Team.find(team.id).name.should == "Foo!" }
      end
    end
  end
end
