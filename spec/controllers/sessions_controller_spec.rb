require 'spec_helper'

describe SessionsController, type: :controller do
  describe 'GET create' do
    it 'passes the origin path from the query string to the view' do
      get :create, originpath: '/drivers'
      expect(assigns[:originpath]).to eq('/drivers')
    end
    it 'passes the root path if there is no query string' do
      get :create
      expect(assigns[:originpath]).to eq(root_path)
    end
  end
  describe 'POST create' do
    before(:each) do
      ENV['BGP_ADMIN_PASSWORD'] = 'foobar'
    end
    it 'gets the admin password from the environment' do
      ENV['BGP_ADMIN_PASSWORD'] = 'gobbledygook'
      post :create, password: 'gobbledygook', originpath: '/drivers'
      expect(session[:role]).to eq('admin')
    end

    describe 'when the password is correct' do
      let(:password) { 'foobar' }
      let(:originpath) { '/drivers' }
      it 'sets the role in the session to admin' do
        post :create, password: password, originpath: originpath
        expect(session[:role]).to eq('admin')
      end
      it 'redirects to the origin path' do
        post :create, password: password, originpath: originpath
        expect(response).to redirect_to(originpath)
      end
      it 'sets the flash notice' do
        post :create, password: password, originpath: originpath
        expect(flash[:notice]).not_to be_nil
      end
    end
    describe 'when the password is wrong' do
      let(:password) { 'gah' }
      let(:originpath) { '/drivers' }
      it 'does not change the role' do
        beforerole = session[:role]
        post :create, password: password, originpath: originpath
        expect(session[:role]).to eq(beforerole)
      end
      it 'renders the form again' do
        post :create, password: password, originpath: originpath
        expect(response).to render_template('create')
      end
      it 'sets the flash error' do
        post :create, password: password, originpath: originpath
        expect(flash[:error]).not_to be_nil
      end
    end
  end
  describe 'GET destroy' do
    let(:originpath) { '/drivers' }
    before(:each) { session[:role] = 'admin' }
    it 'sets the role to guest' do
      get :destroy, originpath: originpath
      expect(session[:role]).not_to eq('admin')
    end
    it 'redirects to the origin path' do
      get :destroy, originpath: originpath
      expect(response).to redirect_to(originpath)
    end
    it 'redirects back to root if no origin path' do
      get :destroy
      expect(response).to redirect_to(root_path)
    end
  end
end
