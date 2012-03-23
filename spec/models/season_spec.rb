require 'spec_helper'

describe "Season" do
  fixtures :all
  before(:each) do
    @season = Season.new(
      :scoring_scheme => mock_model('ScoringScheme'),
      :name => "1999"
    )
  end
  it "is valid with valid parameters" do
    @season.should be_valid
  end
  it "is not valid without a name" do
    @season.name = nil
    @season.should_not be_valid
  end
  it "is not valid without a scoring scheme" do
    @season.scoring_scheme = nil
    @season.should_not be_valid
  end
  describe "#drivers_by_points" do
    it "returns an array of driver entries sorted by points scored" do
      pending "figure out the deal with fixtures"
      season = seasons(:season_2002)
      results = season.drivers_by_points
      results.length.should == 12
      results[0].entrant.should == drivers(:schumacher)
      results[0].points.should == 47
    end
  end
  describe "#to_param" do
    it "returns its name" do
      @season.to_param.should == @season.name
    end
  end
  describe "#teams_by_points" do
    it "returns an array of team entries sorted by points scored" do
      pending
    end
  end
  describe "#drivers_by_qualifying_points" do
    it "returns an array of driver entries by qualifying points"
  end
  describe "#points_for_finishing" do
    it "asks the scoring scheme what the place is worth" do
      @season = Season.new
      scheme = mock_model('ScoringScheme')
      scheme.should_receive(:points_for_finishing).with(1).and_return(9)
      @season.scoring_scheme = scheme
      @season.points_for_finishing(1).should == 9
    end
  end
end
