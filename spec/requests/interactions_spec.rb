require 'spec_helper'

describe "API" do
  before(:each) do
      @app_usr = Factory(:user_app_interactions)
      @user2 = Factory(:Iphone)
      @valid_api_params = {:appKey => "c7496b766f2ec767b3644b3b9cc51147a97b83ce"}
      @interaction = Factory(:valid_interaction)
  end

  describe "writeInteraction" do
    before(:each) do
     @valid_interaction =  {:Loclatitude => "2", :loclongitude =>"2", :PersonA=>"1" , :PersonB=>"2", :Timestamp=>"2010-01-01T10:00:00Z", :deltime=>"10"}
     @valid_request =   @valid_api_params.merge(:Loclatitude => "2", :loclongitude =>"2", :PersonA=>"1" , :PersonB=>"2", :Timestamp=>"2010-01-01T10:00:00Z", :deltime=>"10")
    end

    describe "valid parameters" do
        it "should pass" do
          get '/api/writeInteraction', @valid_request
          Interaction.where(@valid_interaction).should exist
        end
        end

      describe "invalid latitude" do
        it "should fail" do
          get '/api/writeInteraction', @valid_request.merge(:Loclatitude=>"180")
          Interaction.where(@valid_interaction.merge(:Loclatitude=>"180")).should_not exist
        end
        end

        describe "invalid longitude" do
        it "should fail" do
          get '/api/writeInteraction', @valid_request.merge(:loclongitude=>"360")
          Interaction.where(@valid_interaction.merge(:loclongitude=>"360")).should_not exist
        end
        end

        describe "invalid Timestamp" do
        it "should fail" do
          get '/api/writeInteraction', @valid_request.merge(:Timestamp=>"1200")
          Interaction.where(@valid_interaction.merge(:Timestamp=>"1200")).should_not exist
        end
        end
  end
  end


