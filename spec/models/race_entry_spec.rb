require 'spec_helper'

describe RaceEntry do
  let(:race) { FactoryGirl.create(:race) }
  let(:re) { FactoryGirl.create(:race_entry, race: race) }
  it "is valid with valid parameters" do
    re.should be_valid
  end
  it "is invalid without a race" do
    re.race = nil
    re.should_not be_valid
  end
  it "is invalid without a season entry" do
    re.season_entry = nil
    re.should_not be_valid
  end
  it "is invalid without a team" do
    re.team = nil
    re.should_not be_valid
  end
  it "initially is nil for finishing place" do
    re.finish.should be_nil
  end
  it "initially is nil for qualifying place" do
    re.qualify.should be_nil
  end
  it "can mass assign finish and qualify" do
    expect {
      re.update_attributes( "finish" => 1, "qualify" => 3 )
    }.to_not raise_error
  end
  describe "enforces uniqueness of finishing places" do
    let(:re2) { FactoryGirl.create(:race_entry, race: race) }
    it "validates finishing place is unique in the same race" do
      re.finish = 1
      re.save
      re2.finish = 1
      re2.should_not be_valid
    end
    it "alows same finishing place for different races" do
      re.finish = 1
      re.save
      re2.finish = 1
      re2.race = FactoryGirl.create(:race)
      re2.should be_valid
    end
  end
  describe "knows how to compute points for finishes" do
    describe "#finish_points" do
      it "asks the race what the place is worth" do
        re.finish = 1
        race = mock_model('Race')
        race.should_receive(:points_for_finishing).with(1).and_return(9)
        re.race = race
        re.finish_points.should == 9
      end
    end
    describe "#qualifying_points" do
      it "asks the race what the place is worth" do
        re.qualify = 1
        re.dnq = false
        race = mock_model('Race')
        race.should_receive(:points_for_finishing).with(1).and_return(9)
        re.race = race
        re.qualifying_points.should == 9
      end
      it "returns 0 without asking the race if racer did not qualify" do
        re.qualify = 1
        re.dnq = true
        race = mock_model('Race')
        race.should_not_receive(:points_for_finishing)
        re.race = race
        re.qualifying_points.should == 0
      end
    end
  end
end
