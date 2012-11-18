require 'spec_helper'

describe "Logins" do
  describe "GET /logins" do
    def login
      click_link "Log In"
      current_path.should == login_path
      fill_in('password', :with => 'foobar')
      click_button 'Login'
    end
    it "logs in from home page" do
      visit root_path
      login
      current_path.should == root_path
      page.has_content?('Logged in as: admin')
    end
    it "logs in from players page" do
      visit players_path
      login
      current_path.should == players_path
      page.has_content?('Logged in as: admin')
    end
    it "logs out" do
      visit players_path
      login
      click_link "Log Out"
      current_path.should == players_path
      page.has_content?('Logged in as: guest')
    end
  end
end
