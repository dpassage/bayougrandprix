require 'spec_helper'

describe ScoringSchemesController, type: :controller do
  describe 'GET index' do
    it_should_behave_like 'standard index CRUD', :scoring_schemes
  end
  describe 'GET new' do
    it_should_behave_like 'standard new CRUD', :scoring_scheme
  end
  describe 'POST create' do
    let(:create_params) { { 'scoring_scheme' => { 'name' => '9-6-4-3-2-1' } } }
    let(:invalid_params) { { 'scoring_scheme' => {} } }
    context 'when the user is not an admin' do
      before(:each) do
        user_is_guest
      end
      it_should_behave_like 'an unauthorized operation' do
        before(:each) do
          post :create, create_params
        end
      end
    end
    describe 'when the user is an admin' do
      before(:each) do
        user_is_admin
      end
      it_should_behave_like 'standard create CRUD' do
        let(:klass) { ScoringScheme }
        let(:redirect_path) { scoring_schemes_path }
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
