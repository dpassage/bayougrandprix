require 'spec_helper'

shared_examples "an unauthorized operation" do
  it "redirects to the root page" do
    response.should redirect_to(root_path)
  end
  it "sets the error flash" do
    flash[:error].should_not be_nil
  end
end

  