require 'spec_helper'

describe "API" do
  before(:each) do
      @app_usr = Factory(:Iphone)
      @usr = Factory(:user)
      @valid_api_params = {:appKey => @app_usr.api_key, :apiKey => @usr.api_key}
  end


 describe "registerUser" do
    def valid_user
	 @valid_api_params.merge(:username => "aUser", :name => "theirName", :password => "password", :password_confirmation => "password", :sex => "0", :age => "20", :email => "larb@blar.com")
    end
    describe "when registering a user" do
      describe "with valid parameters" do
          it "should succesfully create user" do
		  get 'api/registerUser', valid_user
             User.where(:username => "aUser").should exist
          end
      end
      define "with invalid" do
        define "password confirmation" do
 		it "should fail" do
		   get 'api/registerUser', valid_user.merge(:password_confirmation => "pAssword")
		   User.where(:username => "aUser").should_not exist
		end
        end 
        define "age" do
 		it "should fail" do
		   get 'api/registerUser', valid_user.merge(:age => "-12")
		   User.where(:username => "aUser").should_not exist
		end
        end
        define "email" do
 		it "should fail" do
		   get 'api/registerUser', valid_user.merge(:email => "succkkkkkkaaz.")
		   User.where(:username => "aUser").should_not exist
		end
        end
        define "gender" do
 		it "should fail" do
		   get 'api/registerUser', valid_user.merge(:sex => "sfd")
		   User.where(:username => "aUser").should_not exist
		end
        end

	   before(:each) do
		@premade_user = Factory(:user)	
 	   end
        define "with taken username" do
		it "should fail" do
 		   get 'api/registerUser', valid_user.merge(:username => @premade_user.username)
		   response.status.should_not be :ok
		end
        end 
        define "with taken email" do
		it "should fail" do
 		   get 'api/registerUser', valid_user.merge(:username => @premade_user.username)
		   response.status.should_not be :ok
		end
        end 
      end
    end
  end

  describe "login" do
    describe "when logging into the api from the mobile app" do
        def app_params
          {:appKey => @app_usr.api_key}
        end
        describe "with valid credentials" do
          def params
            app_params.merge(:username => @usr.username, :password => @usr.password)
          end
          before (:each) do
            get '/api/login', params
          end
          it "should return a valid api key" do
            result = response.body
            result.should == User.where(:id => @usr.id).first.api_key
          end
      end
      define "with invalid credentials" do
        it "should not succeed" do
          get '/api/login', app_params.merge(:username => "Invalid", :password => "Invalid")
          response.should_not be_sucessful
        end
      end
    end
    describe "when logging in with an invalid app key" do
      def app_params
        {:appKey => "invalid!" }
      end
      describe "with valid credentials" do
        it "should not succeed" do
          get '/api/login', app_params.merge(:username => @usr.username, :password => @usr.password)
          response.status.should_not be :ok
          end
      end
      describe "invalid credentials" do
        it "should not succeed" do
          get '/api/login', app_params.merge(:username => "blah", :password => "no")
          response.status.should_not be :ok
        end
      end
    end
  end

  describe "logout" do
	def app_params
          {:appKey => @app_usr.api_key}
        end
	def params
            app_params.merge(:username => @usr.username, :password => @usr.password)
          end
    before (:each) do
            get '/api/login', params
            @key2 = response.body
          end
    describe "when logging out of the api from the mobile app" do
        describe "with valid api key" do
          it "should pass" do
            get '/api/logout',  {:apiKey => @key2}
            response.status.should == 200
            User.where(:api_key => @key2).should_not exist
          end
        end

      describe "with invalid api key" do
          it "should fail" do
            get '/api/logout', {:apiKey => "random"}
            response.status.should == 404
            User.where(:api_key => @key2).should exist
          end
      end
        end
  end
  end
 
