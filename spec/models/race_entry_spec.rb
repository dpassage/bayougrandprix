require 'spec_helper'

describe RaceEntry do
  it "is invalid without a race"
  it "is invalid without a driver"
  it "initially is nil for finishing place"
  it "initially is nil for qualifying place"
  describe "#finish_points" do
    it "returns points for finishing"
  end
  describe "#qualifying_points" do
    it "returns points for qualifying"
  end
end
