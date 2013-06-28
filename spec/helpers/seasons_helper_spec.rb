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
describe SeasonsHelper do
  describe '#ordinal' do
    it 'returns Winner for 1' do
      helper.ordinal(1).should == 'Winner'
    end
    it 'returns 2nd for 2' do
      helper.ordinal(2).should == '2nd'
    end
    it 'returns 3rd for 3' do
      helper.ordinal(3).should == '3rd'
    end
    it 'returns 4th for 4' do
      helper.ordinal(4).should == '4th'
    end
  end
end
