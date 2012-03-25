require 'spec_helper'

describe SessionsController do
  describe "GET create" do
    it "passes the origin path from the query string to the view" do
      get :create, :originpath => "/drivers"
      assigns[:originpath].should == "/drivers"
    end
    it "passes the root path if there's no query string" do
      get :create
      assigns[:originpath].should == root_path
    end
  end
  describe "POST create" do
    describe "when the password is correct" do
      let(:password) { "foobar" }
      let(:originpath) { "/drivers" }
      it "sets the role in the session to admin" do
        post :create, :password => password, :originpath => originpath
        session[:role].should == "admin"
      end
      it "redirects to the origin path" do
        post :create, :password => password, :originpath => originpath
        response.should redirect_to(originpath)
      end
      it "sets the flash notice" do
        post :create, :password => password, :originpath => originpath
        flash[:notice].should_not be_nil
      end
    end
  end
end