require 'spec_helper'

describe "Logins" do
  describe "GET /logins" do
    it "logs in from home page" do
      visit root_path
      click_link "Log In"
      current_path.should == login_path
      fill_in('password', :with => 'foobar')
      click_button 'Login'
      current_path.should == root_path
      page.has_content?('Logged in as: admin')
    end
    it "logs in from players page" do
      visit players_path
      click_link "Log In"
      current_path.should == login_path
      fill_in('password', :with => 'foobar')
      click_button 'Login'
      current_path.should == players_path
      page.has_content?('Logged in as: admin')
    end
    
  end
end
