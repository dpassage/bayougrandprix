require 'spec_helper'

describe PlayersController do
  describe "GET index" do
    it_should_behave_like "standard index CRUD", :players
  end
  describe "GET 'new'" do
    it_should_behave_like "standard new CRUD", :player
  end
  describe "GET show" do
    let(:player) { FactoryGirl.create(:player) }
    it "should be successful for a real driver" do
      get 'show', :id => player.to_param
      response.should be_success
    end
    it "should render the show template" do
      get 'show', :id => player.to_param
      response.should render_template("show")
    end
    it "should pass the driver to the template" do
      get 'show', :id => player.to_param
      assigns[:player].should == player
    end
  end
  describe "POST 'create'" do
    let(:create_params) { { player: { name: "Joe", email: "joe@example.com" } } }
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
        }.to change(Player, :count).by(0)
      end
    end
    describe "when the user is an admin" do
      before(:each) do
        user_is_admin
      end
      it_should_behave_like "standard create CRUD" do
        let(:klass) { Player }
        let(:redirect_path) { players_path }
      end
      describe "with invalid parameters" do
        it "renders the new template" do
          post 'create', invalid_params
          response.should render_template("new")
        end
      end
    end
  end
end
