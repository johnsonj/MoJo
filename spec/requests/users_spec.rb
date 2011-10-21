require 'spec_helper'

describe "API" do
  before(:each) do
      @app_usr = Factory(:Iphone)
      @usr = Factory(:user)
      @valid_api_params = {:appKey => @app_usr.api_key, :apiKey => @usr.api_key}
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
    end
  end

end
