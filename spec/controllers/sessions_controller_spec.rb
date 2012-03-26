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
    describe "when the password is wrong" do
      let(:password) { "gah" }
      let(:originpath) { "/drivers" }
      it "does not change the role" do
        beforerole = session[:role]
        post :create, :password => password, :originpath => originpath
        session[:role].should == beforerole
      end
      it "renders the form again" do
        post :create, :password => password, :originpath => originpath
        response.should render_template("create")
      end
      it "sets the flash error" do
        post :create, :password => password, :originpath => originpath
        flash[:error].should_not be_nil
      end
    end
    
  end
  describe "GET destroy" do
    let(:originpath) { "/drivers" }
    before(:each) { session[:role] = "admin" }
    it "sets the role to guest" do
      get :destroy, :originpath => originpath
      session[:role].should_not == "admin"
    end
    it "redirects to the origin path" do
      get :destroy, :originpath => originpath
      response.should redirect_to(originpath)
    end
    it "redirects back to root if no origin path" do
      get :destroy
      response.should redirect_to(root_path)
    end
  end
end