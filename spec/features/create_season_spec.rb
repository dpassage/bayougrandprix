require 'spec_helper'

describe 'Seasons', :type => :feature do
  def login
    click_link 'Log In'
    expect(current_path).to eq login_path
    fill_in('password', with: 'foobar')
    click_button 'Login'
  end
  before(:each) do
    FactoryGirl.create(:scoring_scheme, name: '9-6-4-3-2-1')
  end
  it 'Creates the season' do
    visit root_path
    login
    click_link 'Edit Seasons'
    expect(current_path).to eq seasons_path

    click_link 'Add a season'
    expect(current_path).to eq new_season_path

    fill_in('season_name', with: '2025')
    select('9-6-4-3-2-1', from: 'season_scoring_scheme_id')
    click_button 'Create Season'
    expect(current_path).to eq seasons_path

    expect(page).to have_content '2025'

    page.find(:xpath, '//tr[contains(., "2025")]').find_link('Manage').click
    expect(current_path).to eq('/seasons/2025')
  end
end
