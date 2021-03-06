require 'spec_helper'

describe Team, type: :model do
  before(:each) do
    @team = Team.new(name: 'McLaren', color: Team::COLORS['Blue'])
  end
  it 'is valid with valid parameters' do
    expect(@team).to be_valid
  end
  it 'is not valid without a name' do
    @team.name = nil
    expect(@team).not_to be_valid
  end
  it 'is not valid without a color' do
    @team.color = nil
    expect(@team).not_to be_valid
  end
  it 'is not valid with an invalid color' do
    @team.color = 'This is not an HTML color code'
    expect(@team).not_to be_valid
  end
  it 'has a hash of valid colors' do
    expect(Team::COLORS).to_not be_nil
    expect(Team::COLORS['Blue']).not_to be_nil
  end
  it 'is not fake by default' do
    expect(@team.fake).not_to eq(true)
  end
  it 'is not valid if fake is not set' do
    @team.fake = nil
    expect(@team).not_to be_valid
  end
  describe '#destroy' do
    let(:team) { FactoryGirl.create(:team) }
    let(:otherteam) { FactoryGirl.create(:team) }
    let(:season) { FactoryGirl.create(:season) }
    let(:driver) { FactoryGirl.create(:driver) }
    let(:race) { FactoryGirl.create(:race) }
    it 'cannot be removed if used in a season entry' do
      DriverEntry.create!(defaultteam: team,
                          season: season,
                          driver: driver)
      expect { team.destroy }.to raise_error
    end
    it 'cannot be removed if used in a race entry' do
      de = DriverEntry.create!(defaultteam: team,
                               season: season,
                               driver: driver)
      RaceEntry.create!(race: race, driver_entry: de, team: otherteam)
      expect { otherteam.destroy }.to raise_error
    end
  end
end
