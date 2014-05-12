require 'spec_helper'

describe HomeController do
  describe "GET 'index'" do
    it 'should be successful' do
      get 'index'
      response.should be_success
    end
    it 'should render the index template' do
      get 'index'
      response.should render_template('index')
    end
    it 'should pass an array of seasons' do
      get 'index'
      assigns[:seasons].should_not be_nil
    end
    context 'when there are three seasons' do
      before(:each) do
        FactoryGirl.create(:season, name: '2001')
        FactoryGirl.create(:season, name: '2011')
        FactoryGirl.create(:season, name: '2003')
      end
      it 'should pass all the seasons in the array' do
        get 'index'
        assigns[:seasons].length.should == 3
      end
      it 'should pass an array sorted by name' do
        get 'index'
        expect(assigns[:seasons][0].name).to eq('2001')
        expect(assigns[:seasons][1].name).to eq('2003')
        expect(assigns[:seasons][2].name).to eq('2011')
      end
    end
  end
end
