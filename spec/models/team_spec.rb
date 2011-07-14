require 'spec_helper'

describe Team do
  before(:each) do
    @team = Team.new(:name => "McLaren", :color => Team::Colors["Blue"])
  end
  it "is valid with valid parameters" do
    @team.should be_valid
  end
  it "is not valid without a name" do
    @team.name = nil
    @team.should_not be_valid
  end
  it "is not valid without a color" do
    @team.color = nil
    @team.should_not be_valid
  end
  it "is not valid with an invalid color" do
    @team.color = "This isn't an HTML color code"
    @team.should_not be_valid
  end
  it "has a hash of valid colors" do
    Team::Colors.should_not == nil
    Team::Colors["Blue"].should_not == nil
  end
  it "is not fake by default" do
    @team.fake.should_not == true
  end
  it "is not valid if fake is not set" do
    @team.fake = nil
    @team.should_not be_valid
  end
end
