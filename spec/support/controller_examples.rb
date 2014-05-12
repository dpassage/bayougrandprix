require 'spec_helper'

shared_examples 'standard new CRUD' do |model_name|
  it 'should be successful' do
    get 'new'
    response.should be_success
  end
  it 'should show the new object template' do
    get 'new'
    response.should render_template('new')
  end
  it 'passes a new, unsaved object to the view' do
    get 'new'
    assigns[model_name].should_not be_nil
    assigns[model_name].should be_new_record
  end
end

shared_examples 'standard index CRUD' do |model_name_plural|
  it 'should be successful' do
    get 'index'
    response.should be_success
  end
  it 'should render the index template' do
    get 'index'
    response.should render_template('index')
  end
  it 'should pass an array of objects' do
    get 'index'
    assigns[model_name_plural].should_not be_nil
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
      flash[:notice].should_not be_nil
    end
    it 'redirects to the correct page' do
      post 'create', create_params
      response.should redirect_to(redirect_path)
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
      flash[:error].should_not be_nil
    end
  end
end
