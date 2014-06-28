require 'spec_helper'

describe TeamsController, type: :controller do
  let(:team) { FactoryGirl.create(:team) }
  let(:params) { { id: team.to_param } }
  describe 'GET index' do
    it_should_behave_like 'standard index CRUD', :teams
  end
  describe 'GET new' do
    it_should_behave_like 'standard new CRUD', :team
  end
  describe 'GET show' do
    before(:each) do
      get 'show', params
    end
    it('should be successful') { expect(response).to be_success }
    it('should render the show template') do
      expect(response).to render_template('show')
    end
    it('should pass the team') { expect(assigns[:team]).to eq(team) }
  end
  describe 'GET edit' do
    before(:each) do
      get 'edit', params
    end
    it('should be successful') { expect(response).to be_success }
    it('should render the edit template') do
      expect(response).to render_template('edit')
    end
    it('should pass the team') { expect(assigns[:team]).to eq(team) }
  end
  describe 'POST update' do
    let(:update_params) do
      { 'id' => team.to_param,
        'team' => { 'name' => 'Foo!',
                    'color' => team.color,
                    'fake' => team.fake } }
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
      it('should not change the team') do
        post 'update', update_params
        expect(team.name).not_to eq('Foo!')
      end
    end
    context 'the user is an admin' do
      before(:each) { user_is_admin }
      context 'with valid params' do
        before(:each) { post 'update', update_params }
        it('should redirect to the show template') do
          expect(response).to redirect_to(team_path(team))
        end
        it('should change the team name') do
          expect(Team.find(team.id).name).to eq('Foo!')
        end
      end
    end
  end
  describe 'POST create' do
    let(:create_params) do
      { team: { name: 'New Team',
                color: Team::COLORS['Pink'],
                fake: false } }
    end
    let(:invalid_params) { { team: {} } }
    describe 'when user is not an admin' do
      before(:each) do
        user_is_guest
      end
      it_should_behave_like 'an unauthorized operation' do
        before(:each) do
          post 'create', create_params
        end
      end
      it 'should not create the team' do
        expect { post 'create', create_params }.to change(Team, :count).by(0)
      end
    end
    describe 'when the user is an admin' do
      before(:each) do
        @create_params = create_params
        @teams_path = teams_path
        user_is_admin
      end
      it_should_behave_like 'standard create CRUD' do
        let(:klass) { Team }
        let(:redirect_path) { teams_path }
      end
      describe 'with invalid parameters' do
        it 'renders the new template' do
          post 'create', invalid_params
          expect(response).to render_template('new')
        end
      end
    end
  end
  describe 'DELETE destroy' do
    let(:delete_params) { { 'id' => team.to_param } }
    context 'when the user is not an admin' do
      before(:each) { user_is_guest }
      it_should_behave_like 'an unauthorized operation' do
        before(:each) do
          delete 'destroy', delete_params
        end
      end
      it('should not delete the team') do
        delete 'destroy', delete_params
        expect(Team.find(team.id)).not_to be_nil
      end
    end
    context 'when the user is an admin' do
      before(:each) do
        user_is_admin
      end
      context 'when the team is not used' do
        before(:each) do
          delete 'destroy', delete_params
        end
        it('deletes the team') do
          expect do
            Team.find(team.id)
          end.to raise_error ActiveRecord::RecordNotFound
        end
        it('redirects to teams page') do
          expect(response).to redirect_to(teams_path)
        end
        it('sets the notify flash') do
          expect(flash[:notice]).not_to be_nil
        end
      end
      context 'when the team is used in a driver_entry' do
        before(:each) do
          FactoryGirl.create(:driver_entry, defaultteam: team)
          delete 'destroy', delete_params
        end
        it('is not deleted') { expect(Team.find(team.id)).to eq(team) }
        it('redirects to teams page') do
          expect(response).to redirect_to(teams_path)
        end
        it('sets the error flash') { expect(flash[:error]).not_to be_nil }
      end
      context 'when the team is used in a race_entry' do
        before(:each) do
          otherteam = FactoryGirl.create(:team)
          de = FactoryGirl.create(:driver_entry, defaultteam: otherteam)
          FactoryGirl.create(:race_entry, driver_entry: de, team: team)
          delete 'destroy', delete_params
        end
        it('is not deleted') { expect(Team.find(team.id)).to eq(team) }
        it('redirects to teams page') do
          expect(response).to redirect_to(teams_path)
        end
        it('sets the error flash') { expect(flash[:error]).not_to be_nil }
      end
    end
  end
end
