require 'spec_helper'

describe "home/index" do
  shared_examples "common admin and guest" do
    it "links to the players page" do
      render
      rendered.should have_link("Players", :href => players_path)
    end
    it "links to the drivers page" do
      render
      rendered.should have_link("Drivers", :href => drivers_path)
    end
    it "links to the teams page" do
      render
      rendered.should have_link("Teams", :href => teams_path)
    end
    
    it "shows a table of seasons" do
      assign(:seasons, [])
      render
      rendered.should have_selector("table#results_by_season")
    end
    context "when there are three seasons" do
      before(:each) do
        @season2001 = stub_model(Season, :name => "2001")
        @seasons = [
          @season2001,
          stub_model(Season, :name =>"2003"),
          stub_model(Season, :name =>"2011")
        ]
        assign(:seasons, @seasons)
      end
      it "links the 2001 season to its results page" do
        render
        rendered.should have_selector(
          "a", 
          :href => results_season_path(@season2001)
        )     
      end
    end
    
  end
  context "when the user is not an admin" do
    before(:each) do
      assign(:seasons, [])
      view.should_receive(:admin?).and_return(false)
    end
    include_examples "common admin and guest"
    it "does not have a link to the seasons manager page" do
      render
      rendered.should_not have_link("Edit Seasons")
    end
  end
  context "when the user is an administrator" do
    before(:each) do
      assign(:seasons, [])
      view.should_receive(:admin?).and_return(true)
    end
    include_examples "common admin and guest"
    it "has a link to the seasons manager page" do
      render
      rendered.should have_link("Edit Seasons", :href => seasons_path)
    end
  end
end
