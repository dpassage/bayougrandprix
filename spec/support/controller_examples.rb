require 'spec_helper'

shared_examples 'standard new CRUD' do |model_name|
  it 'should be successful' do
    get 'new'
    expect(response).to be_success
  end
  it 'should show the new object template' do
    get 'new'
    expect(response).to render_template('new')
  end
  it 'passes a new, unsaved object to the view' do
    get 'new'
    expect(assigns[model_name]).not_to be_nil
    expect(assigns[model_name]).to be_new_record
  end
end

shared_examples 'standard index CRUD' do |model_name_plural|
  it 'should be successful' do
    get 'index'
    expect(response).to be_success
  end
  it 'should render the index template' do
    get 'index'
    expect(response).to render_template('index')
  end
  it 'should pass an array of objects' do
    get 'index'
    expect(assigns[model_name_plural]).not_to be_nil
  end
end

shared_examples 'standard create CRUD' do
  # expects: create_params, klass, redirect_path, invalid_params
  describe 'with valid parameters' do
    it 'creates the new object' do
      expect do
        post 'create', create_params
      end.to change(klass, :count).by(1)
    end
    it 'sets the notice flash' do
      post 'create', create_params
      expect(flash[:notice]).not_to be_nil
    end
    it 'redirects to the correct page' do
      post 'create', create_params
      expect(response).to redirect_to(redirect_path)
    end
  end
  describe 'with invalid parameters' do
    it 'does not create a new object' do
      expect do
        post 'create', invalid_params
      end.to change(klass, :count).by(0)
    end
    it 'sets the error flash' do
      post 'create', invalid_params
      expect(flash[:error]).not_to be_nil
    end
  end
end
