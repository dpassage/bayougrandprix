require 'spec_helper'

describe TeamsController do
  let (:team) { FactoryGirl.create(:team) }
  let (:params) { { id: team.to_param } }
  describe "GET index" do
    it_should_behave_like "standard index CRUD", :teams
  end
  describe "GET 'new'" do
    it_should_behave_like "standard new CRUD", :team
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
        user_is_guest
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
      before(:each) { user_is_admin }
      context "with valid params" do
        before(:each) { post 'update', update_params }
        it("should redirect to the show template") { response.should redirect_to(team_path(team)) }
        it("should change the team name") { Team.find(team.id).name.should == "Foo!" }
      end
    end
  end
  describe "POST 'create'" do
    let (:create_params) { { team: { name: "New Team", color: Team::Colors["Pink"], fake: false } } }
    let(:invalid_params) { { team: {}}}
    describe "when user is not an admin" do
      before(:each) do
        user_is_guest
      end
      it_should_behave_like "an unauthorized operation" do
        before(:each) do
          post 'create', create_params
        end
      end
      it "should not create the team" do
        expect {
          post 'create', create_params
        }.to change(Team, :count).by(0)
      end
    end
    describe "when the user is an admin" do
      before(:each) do
        @create_params = create_params
        @teams_path = teams_path
        user_is_admin
      end
      it_should_behave_like "standard create CRUD" do
        let(:klass) { Team }
        let(:redirect_path) { teams_path }
      end
      describe "with invalid parameters" do
        it "renders the new template" do
          post 'create', invalid_params
          response.should render_template("new")
        end
      end
    end
  end
  describe "DELETE 'destroy'" do
    let (:delete_params) { { "id" => team.to_param } }
    context "when the user is not an admin" do
      before(:each) {
        user_is_guest
      }
      it_should_behave_like "an unauthorized operation" do
        before(:each) do
          delete 'destroy', delete_params
        end
      end
      it("should not delete the team") do
        delete 'destroy', delete_params
        Team.find(team.id).should_not be_nil
      end
    end
    context "when the user is an admin" do
      before(:each) do 
        user_is_admin
      end
      context "when the team is not used" do
        before (:each) do
          delete 'destroy', delete_params 
        end
        it("deletes the team") { 
          expect {
            Team.find(team.id)
          }.to raise_error ActiveRecord::RecordNotFound
        }
        it("redirects to teams page") { 
          response.should redirect_to(teams_path) 
        }
        it("sets the notify flash") { 
          flash[:notice].should_not be_nil 
        }
      end
      context "when the team is used in a season_entry" do
        before (:each) do
          se = FactoryGirl.create(:season_entry, defaultteam: team) 
          delete 'destroy', delete_params 
        end
        it("is not deleted") { Team.find(team.id).should == team }
        it("redirects to teams page") { response.should redirect_to(teams_path) }
        it("sets the error flash") { flash[:error].should_not be_nil }
      end
      context "when the team is used in a race_entry" do
        before (:each) do
          otherteam = FactoryGirl.create(:team) 
          se = FactoryGirl.create(:season_entry, defaultteam: otherteam)
          re = FactoryGirl.create(:race_entry, season_entry: se, team: team)
          delete 'destroy', delete_params 
        end
        it("is not deleted") { Team.find(team.id).should == team }
        it("redirects to teams page") { response.should redirect_to(teams_path) }
        it("sets the error flash") { flash[:error].should_not be_nil }
      end
    end
  end
end
