require 'spec_helper'

describe Track do
  before(:each) do
    @track = Track.new(
      name: 'Beachfront Mambo',
      country: 'Bahamas',
      number: '532'
    )
  end
  it 'is valid with valid parameters' do
    @track.should be_valid
  end
  it 'is not valid without a name' do
    @track.name = nil
    @track.should_not be_valid
  end
  it 'is not valid without a number' do
    @track.number = nil
    @track.should_not be_valid
  end
  it 'is valid without a country' do
    @track.country = nil
    @track.should be_valid
  end
  describe '#destroy' do
    let(:track) { FactoryGirl.create(:track) }
    it 'cannot be removed if track has been used in a race' do
      FactoryGirl.create(:race, track: track)
      expect { track.destroy }.to raise_error
    end
    it 'can be removed if track has not been used in a race' do
      saved_id = track.id
      track.destroy
      expect do
        Track.find(saved_id)
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
