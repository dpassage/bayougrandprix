require 'spec_helper'

describe 'Logins', :type => :feature do
  describe 'GET /logins' do
    def login
      click_link 'Log In'
      expect(current_path).to eq login_path
      fill_in('password', with: 'foobar')
      click_button 'Login'
    end
    it 'logs in from home page' do
      visit root_path
      login
      expect(current_path).to eq root_path
      page.has_content?('Logged in as: admin')
    end
    it 'logs in from players page' do
      visit players_path
      login
      expect(current_path).to eq players_path
      page.has_content?('Logged in as: admin')
    end
    it 'logs out' do
      visit players_path
      login
      click_link 'Log Out'
      expect(current_path).to eq players_path
      page.has_content?('Logged in as: guest')
    end
  end
end
