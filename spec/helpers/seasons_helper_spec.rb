require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe 'string concat' do
#     it 'concats two strings with spaces' do
#       helper.concat_strings('this','that').should == 'this that'
#     end
#   end
# end
describe SeasonsHelper, type: :helper do
  describe '#ordinal' do
    it 'returns Winner for 1' do
      expect(helper.ordinal(1)).to eq('Winner')
    end
    it 'returns 2nd for 2' do
      expect(helper.ordinal(2)).to eq('2nd')
    end
    it 'returns 3rd for 3' do
      expect(helper.ordinal(3)).to eq('3rd')
    end
    it 'returns 4th for 4' do
      expect(helper.ordinal(4)).to eq('4th')
    end
  end
end
