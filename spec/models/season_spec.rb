require 'spec_helper'

describe "Season" do
  it "is valid with valid parameters"
  it "is not valid without a name"
  it "is not valid without a scoring scheme"
  describe "#drivers_by_points" do
    it "returns an array of driver entries sorted by points scored"
  end
  describe "#to_param" do
    it "returns its name"
  end
  describe "#teams_by_points" do
    it "returns an array of team entries sorted by points scored"
  end
  describe "#drivers_by_qualifying_points" do
    it "returns an array of driver entries by qualifying points"
  end
end
