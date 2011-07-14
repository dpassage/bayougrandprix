require 'spec_helper'

describe Player do
  before(:each) do
    @player = Player.new(:name => "David", :email => "david@example.com")
  end
  it "is valid with valid parameters"
  it "is not valid without a name"
  it "is valid without an email"
end