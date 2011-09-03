require 'spec_helper'

describe SeasonEntry do
  before (:each) do
    @se = SeasonEntry.new(
      :season => mock_model("Season"),
      :defaultteam => mock_model("Team"),
      :driver => mock_model("Driver")
    )
  end
  it "is valid with valid parameters" do
    @se.should be_valid
  end
  it "is invalid without a season" do
    @se.season = nil
    @se.should_not be_valid
  end
  it "is invalid without a default team" do
    @se.defaultteam = nil
    @se.should_not be_valid
  end
  it "is invalid without a driver" do
    @se.driver = nil
    @se.should_not be_valid
  end
end
