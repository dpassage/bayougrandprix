require 'spec_helper'

describe DriversController, type: :controller do
  let(:driver) { FactoryGirl.create(:driver) }
  describe 'GET index' do
    it_should_behave_like 'standard index CRUD', :drivers
  end
  describe 'GET new' do
    it_should_behave_like 'standard new CRUD', :driver
  end
  describe 'GET show' do
    it 'should be successful for a real driver' do
      get 'show', id: driver.to_param
      expect(response).to be_success
    end
    it 'should render the show template' do
      get 'show', id: driver.to_param
      expect(response).to render_template('show')
    end
    it 'should pass the driver to the template' do
      get 'show', id: driver.to_param
      expect(assigns[:driver]).to eq(driver)
    end
  end
  describe 'GET edit' do
    before(:each) do
      get 'edit', 'id' => driver.to_param
    end
    it('should be successful') { expect(response).to be_success }
    it 'should render the edit template' do
      expect(response).to render_template('edit')
    end
    it('should pass the team') { expect(assigns[:driver]).to eq(driver) }
  end
  describe 'POST update' do
    let(:update_params) do
      { 'id' => driver.to_param,
        'driver' => { 'name' => 'Foo!' } }
    end
    context 'the user is not an admin' do
      before(:each) do
        user_is_guest
      end
      it_should_behave_like 'an unauthorized operation' do
        before(:each) do
          post 'update', update_params
        end
      end
      it 'should not change the team' do
        post 'update', update_params
        expect(Driver.find(update_params['id']).name).not_to eq('Foo!')
      end
    end
    context 'the user is an admin' do
      before(:each) { user_is_admin }
      context 'with valid params' do
        before(:each) { post 'update', update_params }
        it 'should redirect to the drivers list' do
          expect(response).to redirect_to(drivers_path)
        end
        it 'should change the team name' do
          expect(Driver.find(update_params['id']).name).to eq('Foo!')
        end
        it 'should set the notice flash' do
          expect(flash[:notice]).not_to be_nil
        end
      end
    end
  end
  describe 'POST create' do
    let(:player) { FactoryGirl.create(:player) }
    let(:create_params) do
      { 'driver' => { 'name' => 'Hank Stinkfinger',
                      'player_id' => player.to_param }
      }
    end
    let(:invalid_params) { { driver: {} } }
    context 'the user is not an admin' do
      before(:each) do
        user_is_guest
      end
      it_should_behave_like 'an unauthorized operation' do
        before(:each) do
          post 'create', create_params
        end
      end
    end
    context 'when the user is an admin' do
      before(:each) do
        @create_params = create_params
        @drivers_path = drivers_path
        user_is_admin
      end
      it_should_behave_like 'standard create CRUD' do
        let(:klass) { Driver }
        let(:redirect_path) { drivers_path }
      end
      describe 'with invalid parameters' do
        it 'renders the new template' do
          post 'create', invalid_params
          expect(response).to render_template('new')
        end
      end
    end
  end
end
