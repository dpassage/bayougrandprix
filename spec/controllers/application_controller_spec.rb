require 'spec_helper'

describe ApplicationController, type: :controller do
  describe '#authorize' do
    context 'when the user is the admin' do
      before(:each) do
        user_is_admin
      end
      it 'returns true' do
        result = controller.authorize
        expect(result).to be_truthy
      end
      it 'does not set the error flash' do
        controller.authorize
        expect(flash[:error]).to be_nil
      end
    end
    context 'when the user is not the admin' do
      before(:each) do
        user_is_guest
        allow(controller).to receive(:redirect_to)
      end
      it 'returns false' do
        result = controller.authorize
        expect(result).to be_falsey
      end
      it 'sets the error flash' do
        controller.authorize
        expect(flash[:error]).not_to be_nil
      end
      it 'redirects to the root path' do
        expect(controller).to receive(:redirect_to).with(root_path)
        controller.authorize
      end
    end
  end
  describe '#admin?' do
    it 'returns true when the session role is admin' do
      session[:role] = 'admin'
      expect(controller.admin?).to be_truthy
    end
    it 'returns false when the session role is something else' do
      session[:role] = 'joe bob'
      expect(controller.admin?).to be_falsey
    end
  end
  describe '#logged_in_as' do
    it 'returns \'admin\' when the user is an admin' do
      user_is_admin
      expect(controller.logged_in_as).to eq('admin')
    end
    it 'returns \'guest\' when the user is not an admin' do
      user_is_guest
      expect(controller.logged_in_as).to eq('guest')
    end
  end
end
