require 'spec_helper'

describe DriverEntriesController, type: :controller do
  describe 'POST create' do
    let(:season) { FactoryGirl.create(:season) }
    let(:driver) { FactoryGirl.create(:driver) }
    let(:team) { FactoryGirl.create(:team) }
    let(:post_params) do
      { 'season_id' => season.to_param,
        'driver_entry' => {
          'driver_id' => driver.to_param,
          'defaultteam_id' => team.to_param
        }
      }
    end
    context 'when the user is not an admin' do
      before(:each) do
        user_is_guest
      end
      it_should_behave_like 'an unauthorized operation' do
        before(:each) do
          post 'create', post_params
        end
      end
    end
    context 'when the user is an admin' do
      before(:each) do
        user_is_admin
      end
      context 'with an unused driver' do
        it 'creates a new season_entry' do
          expect do
            post 'create', post_params
          end.to change(season.driver_entries, :count).by(1)
        end
        it 'sets the notice flash' do
          post 'create', post_params
          expect(flash[:notice]).not_to be_nil
        end
        it 'does not set the error flash' do
          post 'create', post_params
          expect(flash[:error]).to be_nil
        end
        it 'redirects to the season' do
          post 'create', post_params
          expect(response).to redirect_to(season_path(season))
        end
      end
      context 'with a used driver' do
        before(:each) do
          DriverEntry.create(season: season,
                             driver: driver,
                             defaultteam: team)
        end
        it 'does not create a new driver_entry' do
          expect do
            post 'create', post_params
          end.to change(season.driver_entries, :count).by(0)
        end
        it 'sets the error flash' do
          post 'create', post_params
          expect(flash[:error]).not_to be_nil
        end
        it 'redirects to the season' do
          post 'create', post_params
          expect(response).to redirect_to(season_path(season))
        end
      end
    end
  end
  describe 'DELETE destroy' do
    let(:season) { FactoryGirl.create(:season) }
    let(:driver_entry) do
      FactoryGirl.create(:driver_entry, season: season)
    end
    let(:delete_params) do
      { id: driver_entry.to_param, season_id: season.to_param }
    end
    context 'when the user is not an admin' do
      before(:each) do
        user_is_guest
      end
      it_should_behave_like 'an unauthorized operation' do
        before(:each) do
          delete 'destroy', delete_params
        end
      end
    end
    context 'when the user is an admin' do
      before(:each) do
        user_is_admin
      end
      it 'removes the season entry' do
        delete 'destroy', delete_params
        expect do
          DriverEntry.find(driver_entry.id)
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
      it 'does not set the error flash' do
        delete 'destroy', delete_params
        expect(flash[:error]).to be_nil
      end
      it 'redirects to the season' do
        delete 'destroy', delete_params
        expect(response).to redirect_to(season_path(season))
      end
      context 'when the driver has been entered in a race that season' do
        let(:race) { FactoryGirl.create(:race, season: season) }
        before(:each) do
          FactoryGirl.create(:race_entry,
                             race: race,
                             driver_entry: driver_entry,
                             team: driver_entry.defaultteam)
        end
        it 'does not remove the season entry' do
          delete 'destroy', id: driver_entry.id, season_id: season.to_param
          expect(DriverEntry.find(driver_entry.id)).to eq(driver_entry)
        end
        it 'sets the error flash' do
          delete 'destroy', id: driver_entry.id, season_id: season.to_param
          expect(flash[:error]).not_to be_nil
        end
        it 'redirects to the season' do
          delete 'destroy', id: driver_entry.id, season_id: season.to_param
          expect(response).to redirect_to(season_path(season))
        end
      end
    end
  end
  describe 'GET edit' do
    let (:season) { FactoryGirl.create(:season) }
    let (:driver_entry) { FactoryGirl.create(:driver_entry, season: season) }
    before(:each) do
      get 'edit', 'season_id' => season.to_param, 'id' => driver_entry.to_param
    end
    it('should be successful') { expect(response).to be_success }
    it 'should render the edit template' do
      expect(response).to render_template('edit')
    end
    it('should pass the entry') { expect(assigns[:driver_entry]).to eq(driver_entry) }
  end
  describe 'POST update' do
    let (:season) { FactoryGirl.create(:season) }
    let (:driver_entry) { FactoryGirl.create(:driver_entry, season: season) }
    let (:new_team) { FactoryGirl.create(:team, name: 'The New Team') }
    let(:update_params) do
      { 'id' => driver_entry.to_param,
        'season_id' => season.to_param,
        'driver_entry' => {'defaultteam_id' => new_team.to_param } }
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
        expect(DriverEntry.find(update_params['id']).defaultteam.name).not_to eq('The New Team')
      end
    end
    context 'the user is an admin' do
      before(:each) { user_is_admin }
      context 'with valid params' do
        before(:each) { post 'update', update_params }
        it 'should redirect to the season' do
          expect(response).to redirect_to(season_path(season))
        end
        it 'should change the team name' do
          expect(DriverEntry.find(update_params['id']).defaultteam.name).to eq('The New Team')
        end
        it 'should set the notice flash' do
          expect(flash[:notice]).not_to be_nil
        end
      end
    end
  end
end
