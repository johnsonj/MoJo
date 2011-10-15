require 'spec_helper'

describe SessionsController do
  render_views

  def valid_attributes
    usr = Factory[:user]
    {:username => usr.username, :password => usr.password, :password_confirmation => usr.password}
  end

  describe "GET 'new'" do

    it "should be successful" do
      get :new
      response.should be_success
    end

  end

  describe "POST 'create'" do

    describe "invalid login" do

      before(:each) do
        @attr = {:email => "email@example.com", :password => "invalid"}
      end

      it "should re-render the new page" do
        post :create, :session => @attr
        response.should render_template('new')
      end

      it "should have a flash.now message" do
        post :create, :session => @attr
        flash.now[:error].should =~ /invalid/i
      end

    end

    describe "with valid email and password" do

      before(:each) do
        @user = Factory(:user)
        @attr = {:username => @user.username, :password => @user.password}
      end

      it "should sign the user in" do
        post :create, :session => @attr
        controller.isLoggedIn?.should be_true
        controller.isLoggedIn?.should == @user
      end

      it "should redirect to the user show page" do
        post :create, :session => @attr
        response.should redirect_to(:home_page)
      end

    end

  end

end
