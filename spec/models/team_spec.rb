require 'spec_helper'

describe Team do
  it "is valid with valid parameters"
  it "is not valid without a name"
  it "is not valid without a color"
  it "is not valid with an invalid color"
  it "has a hash of valid colors"
  it "is not valid if fake is not set"
  it "is not valid if fake is not true or false"
end