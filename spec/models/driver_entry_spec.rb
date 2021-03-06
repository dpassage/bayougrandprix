require 'spec_helper'

describe DriverEntry, type: :model do
  let(:season) { FactoryGirl.create(:season) }
  let(:team) { FactoryGirl.create(:team) }
  let(:driver) { FactoryGirl.create(:driver) }
  before(:each) do
    @de = DriverEntry.new(
      season_id: season.id,
      defaultteam_id: team.id,
      driver_id: driver.id)
  end
  it 'is valid with valid parameters' do
    expect(@de).to be_valid
  end
  it 'is invalid without a season' do
    @de.season = nil
    expect(@de).not_to be_valid
  end
  it 'is invalid without a default team' do
    @de.defaultteam = nil
    expect(@de).not_to be_valid
  end
  it 'is invalid without a driver' do
    @de.driver = nil
    expect(@de).not_to be_valid
  end
  describe '#destroy' do
    let(:race) { FactoryGirl.create(:race) }
    let(:driver_entry) { FactoryGirl.create(:driver_entry) }
    it 'can not be deleted if the driver has finished a race that season' do
      RaceEntry.create!(race: race,
                        driver_entry: driver_entry, team: team)
      expect { driver_entry.destroy }.to raise_error
    end
  end
  describe '#finish_points' do
    it 'returns 0 when the driver has not been entered into a race' do
      expect(@de.finish_points).to eq(0)
    end
    it 'asks each race entry how many points it is worth' do
      # create an array of 2 mock race entries
      # they should receive finish_points
      re1 = stub_model(RaceEntry)
      expect(re1).to receive(:finish_points).and_return(1)
      re2 = stub_model(RaceEntry)
      expect(re2).to receive(:finish_points).and_return(1)
      race_entries = [re1, re2]
      # stub driver_entry.race_entries to return this array
      allow(@de).to receive(:race_entries).and_return(race_entries)
      # call the finish_points function
      @de.finish_points
    end
  end
  describe '#finishes_in_place' do
    it 'returns 0 when the driver has not been entered into a race' do
      [1..10].each do |n|
        expect(@de.finishes_in_place(n)).to eq(0)
      end
    end
    it 'returns 2 if the driver won two races' do
      2.times do
        FactoryGirl.create(:race_entry,
                           race: FactoryGirl.create(:race),
                           driver_entry: @de, finish: 1)
      end
      expect(@de.finishes_in_place(1)).to eq(2)
    end
  end
end
