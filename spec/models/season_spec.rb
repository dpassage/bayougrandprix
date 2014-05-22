require 'spec_helper'

describe 'Season', :type => :model do
  fixtures :all
  let(:ss) { FactoryGirl.create(:scoring_scheme) }
  before(:each) do
    @season = Season.new(
      scoring_scheme_id: ss.to_param,
      name: '1999'
    )
  end
  # Unloads all the fixtures loaded at the top of this spec
  # The order is important due to dependencies
  after(:all) do
    RaceEntry.destroy_all
    DriverEntry.destroy_all
    Driver.destroy_all
    Player.destroy_all
    Race.destroy_all
    Season.destroy_all
    ScoringScheme.destroy_all
    Team.destroy_all
    Track.destroy_all
  end
  it 'is valid with valid parameters' do
    expect(@season).to be_valid
  end
  it 'is not valid without a name' do
    @season.name = nil
    expect(@season).not_to be_valid
  end
  it 'is not valid without a scoring scheme' do
    @season.scoring_scheme_id = nil
    expect(@season).not_to be_valid
  end
  it 'is not valid if the scoring scheme id does not exist' do
    invalid_id = ScoringScheme.maximum('id') + 1
    @season.scoring_scheme_id = invalid_id
    expect(@season).not_to be_valid
  end
  describe '#destroy' do
    let(:season) { FactoryGirl.create(:season) }
    let(:track) { FactoryGirl.create(:track) }
    let(:team) { FactoryGirl.create(:team) }
    let(:driver) { FactoryGirl.create(:driver) }
    it 'cannot be removed if there are races in the season' do
      Race.create!(track: track, season: season, date: Time.new)
      expect { season.destroy }.to raise_error
    end
    it 'cannot be removed if there are drivers entered in the season' do
      DriverEntry.create!(defaultteam: team,
                          season: season,
                          driver: driver)
      expect { season.destroy }.to raise_error
    end
  end
  describe '#drivers_by_points' do
    it 'returns an array of driver entries sorted by points scored' do
      season = seasons(:season_2002)
      results = season.drivers_by_points
      expect(results.length).to eq(12)
      expect(results[0].entrant).to eq(drivers(:schumacher))
      expect(results[0].points).to eq(47)
    end
    it 'counts number of wins if tied on points' do
      scheme = FactoryGirl.create(:scoring_scheme, name: '9-6-4-3-2-1')
      season = FactoryGirl.create(:season, scoring_scheme: scheme)
      alice = FactoryGirl.create(:driver, name: 'alice')
      bob = FactoryGirl.create(:driver, name: 'bob')
      bob_se = FactoryGirl.create(:driver_entry, season: season, driver: bob)
      alice_se = FactoryGirl.create(:driver_entry,
                                    season: season, driver: alice)
      race1 = FactoryGirl.create(:race, season: season)
      FactoryGirl.create(:race_entry,
                         race: race1, driver_entry: alice_se, finish: 1)
      FactoryGirl.create(:race_entry,
                         race: race1, driver_entry: bob_se,   finish: 2)
      race2 = FactoryGirl.create(:race, season: season)
      FactoryGirl.create(:race_entry,
                         race: race2, driver_entry: alice_se, finish: 10)
      FactoryGirl.create(:race_entry,
                         race: race2, driver_entry: bob_se,   finish: 4)
      results = season.drivers_by_points
      expect(results.length).to eq(2)
      expect(results[0].entrant.id).to eq(alice.id)
      expect(results[1].entrant.id).to eq(bob.id)
    end
  end
  describe '#to_param' do
    it 'returns its name' do
      expect(@season.to_param).to eq(@season.name)
    end
  end
  describe '#teams_by_points' do
    it 'returns an array of team entries sorted by points scored' do
      season = seasons(:season_2002)
      results = season.teams_by_points
      expect(results.length).to eq(5)
      expect(results[0].entrant).to eq(teams(:mclaren))
      expect(results[0].points).to eq(85)
    end
  end
  describe '#drivers_by_qualifying_points' do
    it 'returns an array of driver entries by qualifying points' do
      season = seasons(:season_2002)
      results = season.drivers_by_qualifying_points
      expect(results.length).to eq(12)
      expect(results[0].entrant).to eq(drivers(:schumacher))
      expect(results[0].points).to eq(67)
    end
  end
  describe '#points_for_finishing' do
    it 'asks the scoring scheme what the place is worth' do
      @season = Season.new
      scheme = mock_model('ScoringScheme')
      expect(scheme).to receive(:points_for_finishing).with(1).and_return(9)
      @season.scoring_scheme = scheme
      expect(@season.points_for_finishing(1)).to eq(9)
    end
  end
  describe Season::TableEntry do
    describe '#points_description' do
      it 'returns just points if finishes not used in sort' do
        te = Season::TableEntry.new
        te.points = 4
        expect(te.points_description).to eql('4')
      end
      it 'returns points and some finishes if finishes in sort' do
        te = Season::TableEntry.new
        te.points = 4
        te.finishes = [nil, 1, 0, 4]
        expect(te.points_description).to eql('4, 1 win, 4 3rds')
      end
    end
  end
end
