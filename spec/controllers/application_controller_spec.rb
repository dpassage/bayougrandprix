require 'spec_helper'

describe ApplicationController do
  describe '#authorize' do
    context 'when the user is the admin' do
      before(:each) do
        user_is_admin
      end
      it 'returns true' do
        result = controller.authorize
        result.should be_true
      end
      it 'does not set the error flash' do
        controller.authorize
        flash[:error].should be_nil
      end
    end
    context 'when the user is not the admin' do
      before(:each) do
        user_is_guest
        controller.stub(:redirect_to)
      end
      it 'returns false' do
        result = controller.authorize
        result.should be_false
      end
      it 'sets the error flash' do
        controller.authorize
        flash[:error].should_not be_nil
      end
      it 'redirects to the root path' do
        controller.should_receive(:redirect_to).with(root_path)
        controller.authorize
      end
    end
  end
  describe '#admin?' do
    it 'returns true when the session role is admin' do
      session[:role] = 'admin'
      controller.admin?.should be_true
    end
    it 'returns false when the session role is something else' do
      session[:role] = 'joe bob'
      controller.admin?.should be_false
    end
  end
  describe '#logged_in_as' do
    it 'returns \'admin\' when the user is an admin' do
      user_is_admin
      controller.logged_in_as.should == 'admin'
    end
    it 'returns \'guest\' when the user is not an admin' do
      user_is_guest
      controller.logged_in_as.should == 'guest'
    end
  end
end
