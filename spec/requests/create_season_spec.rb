require 'spec_helper'

describe "Seasons" do
  def login
    click_link "Log In"
    current_path.should == login_path
    fill_in('password', :with => 'foobar')
    click_button 'Login'
  end      
  it "Creates the season" do
    pending "link on seasons page named 'Manage' goes to season page"
    visit root_path
    login
    click_link 'Edit Seasons'
    current_path.should == seasons_path
    
    click_link 'Add a season'
    current_path.should == new_season_path
    
    fill_in('season_name', :with => "2025")
    select('9-6-4-3-2-1', :from => 'season_scoring_scheme_id')
    click_button 'Create Season'
    current_path.should == seasons_path
    
    page.should have_content "2025"
    
    page.find(:xpath, '//tr[contains(., "2025")]').find_link('Manage').click
    current_path.should == '/seasons/2025'
    puts current_path
  end
end
      