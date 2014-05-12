require 'spec_helper'

describe Player do
  before(:each) do
    @player = Player.new(name: 'David', email: 'david@example.com')
  end
  it 'is valid with valid parameters' do
    @player.should be_valid
  end
  it 'is not valid without a name' do
    @player.name = nil
    @player.should_not be_valid
  end
  it 'is valid without an email' do
    @player.email = nil
    @player.should be_valid
  end
  describe '#destroy' do
    let(:player) { FactoryGirl.create('player') }
    it 'cannot be removed if there is a linked driver' do
      FactoryGirl.create('driver', player: player)
      expect { player.destroy }.to raise_error
    end
  end
end
