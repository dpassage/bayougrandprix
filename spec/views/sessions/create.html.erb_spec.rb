require 'spec_helper'

describe 'sessions/create', :type => :view do
  it 'includes originpath as a hidden field in the form' do
    @originpath = '/thisisatestpath'
    render
    expect(rendered).to have_selector('#originpath')
  end
end
