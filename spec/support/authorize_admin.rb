require 'spec_helper'

shared_examples 'an unauthorized operation' do
  it 'redirects to the root page' do
    expect(response).to redirect_to(root_path)
  end
  it 'sets the error flash' do
    expect(flash[:error]).not_to be_nil
  end
end

def user_is_admin
  allow(controller).to receive(:admin?).and_return(true)
end

def user_is_guest
  allow(controller).to receive(:admin?).and_return(false)
end
