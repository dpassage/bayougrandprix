require 'spec_helper'

describe Race, type: :model do
  let(:track) { FactoryGirl.create(:track) }
  let(:season) { FactoryGirl.create(:season) }
  before(:each) do
    @race = Race.new(
      track_id: track.id,
      season_id: season.id,
      date: Date.today,
      writeup: 'This is a writeup')
  end
  it 'is valid with valid parameters' do
    expect(@race).to be_valid
  end
  it 'is invalid without a season' do
    @race.season_id = nil
    expect(@race).not_to be_valid
  end
  it 'is invalid without a track' do
    @race.track_id = nil
    expect(@race).not_to be_valid
  end
  it 'is invalid without a date' do
    @race.date = nil
    expect(@race).not_to be_valid
  end
  it 'is valid without a writeup' do
    @race.writeup = nil
    expect(@race).to be_valid
  end
  describe '#destroy' do
    let(:race) { FactoryGirl.create(:race) }
    let(:driver_entry) { FactoryGirl.create(:driver_entry) }
    let(:team) { FactoryGirl.create(:team) }
    it 'cannot be destroyed if someone has entered the race' do
      RaceEntry.create!(race: race,
                        driver_entry: driver_entry,
                        team: team)
      expect { race.destroy }.to raise_error
    end
  end
  describe '#points_for_finishing' do
    it 'asks the season what the place is worth' do
      season = mock_model('Season')
      expect(season).to receive(:points_for_finishing).with(1).and_return(9)
      @race.season = season
      expect(@race.points_for_finishing(1)).to eq(9)
    end
  end
end
