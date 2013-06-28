require 'spec_helper'

describe 'sessions/create' do
  it 'includes originpath as a hidden field in the form' do
    @originpath = '/thisisatestpath'
    render
    rendered.should have_selector('#originpath')
  end
end