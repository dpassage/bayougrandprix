require 'spec_helper'

describe 'ScoringScheme', type: :model do
  before(:each) do
    @ss = ScoringScheme.new(name: '9-6-4-3-2-1')
  end
  it 'is valid with valid parameters' do
    expect(@ss).to be_valid
  end
  it 'is not valid without a name' do
    @ss.name = nil
    expect(@ss).not_to be_valid
  end
  it 'is not valid if the name is not properly formatted' do
    @ss.name = 'This is not a valid scoring scheme name'
    expect(@ss).not_to be_valid
  end
  it 'is valid with a 2-digit points value' do
    @ss.name = '10-6-4-3-2-1'
    expect(@ss).to be_valid
  end
  it 'is valid with the 20110 formula 1 points values' do
    @ss.name = '25-18-15-12-10-8-6-4-2-1'
    expect(@ss).to be_valid
  end
  describe '#destroy' do
    let(:scoring_scheme) { FactoryGirl.create(:scoring_scheme) }
    it 'cannot be removed if it is in use in a season' do
      Season.create!(scoring_scheme: scoring_scheme, name: '2037')
      expect { scoring_scheme.destroy }.to raise_error
    end
  end
  describe '#points_for_finishing' do
    context 'with a scheme named 9-6-4-3-2-1' do
      before(:each) do
        @scheme = ScoringScheme.new(name: '9-6-4-3-2-1')
      end
      it 'returns 9 for 1st' do
        expect(@scheme.points_for_finishing(1)).to eq(9)
      end
      it 'returns 6 for 2nd' do
        expect(@scheme.points_for_finishing(2)).to eq(6)
      end
      it 'returns 4 for 3rd' do
        expect(@scheme.points_for_finishing(3)).to eq(4)
      end
      it 'returns 3 for 4th' do
        expect(@scheme.points_for_finishing(4)).to eq(3)
      end
      it 'returns 2 for 5th' do
        expect(@scheme.points_for_finishing(5)).to eq(2)
      end
      it 'returns 1 for 6th' do
        expect(@scheme.points_for_finishing(6)).to eq(1)
      end
      it 'returns 0 for 7th' do
        expect(@scheme.points_for_finishing(7)).to eq(0)
      end
      it 'returns 0 for nil' do
        expect(@scheme.points_for_finishing(nil)).to eq(0)
      end
    end
  end
end
