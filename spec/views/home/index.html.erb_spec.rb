require 'spec_helper'

describe "home/index" do
  context "when the user is not an admin" do
    before(:each) do
      assign(:seasons, [])
      view.should_receive(:admin?).and_return(false)
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
    it "does not have a link to the seasons manager page" do
      render
      rendered.should_not have_selector("a", :text => "Edit Seasons")
    end
  end
  context "when the user is an administrator" do
    before(:each) do
      assign(:seasons, [])
      view.should_receive(:admin?).and_return(true)
    end
    it "has a link to the seasons manager page" do
      render
      rendered.should have_selector("a", :text => "Edit Seasons")
    end
  end
end
