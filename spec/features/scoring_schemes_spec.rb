require 'spec_helper'

describe 'Scoring Schemes' do
  def login
    click_link 'Log In'
    expect(current_path).to eq login_path
    fill_in('password', with: 'foobar')
    click_button 'Login'
  end
  it 'Creates the scoring scheme' do
    visit root_path
    login
    click_link 'Scoring Schemes'
    expect(current_path).to eq scoring_schemes_path

    click_link 'New Scoring scheme'
    expect(current_path).to eq new_scoring_scheme_path

    fill_in('scoring_scheme_name', with: '9-6-4-3-2-1')
    click_button 'Create Scoring scheme'
    expect(current_path).to eq scoring_schemes_path

    page.should have_content '9-6-4-3-2-1'
  end
end
