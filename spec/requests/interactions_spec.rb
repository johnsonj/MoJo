require 'spec_helper'

describe "API" do
  before(:each) do
      @app_usr = Factory(:user_app_interactions)
      @user2 = Factory(:Iphone)
      @valid_api_params = {:appKey => @app_usr.api_key}
      @interaction = Factory(:valid_interaction)
  end

  describe "writeInteraction" do
    before(:each) do
     @valid_interaction =  {:Loclatitude => "2", :loclongitude =>"2", :PersonA=>@app_usr.id , :PersonB=>@user2.id, :Timestamp=>"2010-01-01T10:00:00Z", :deltime=>"10"}
     @valid_request =   @valid_api_params.merge(:Loclatitude => "2", :loclongitude =>"2", :PersonA=>@app_usr.id , :PersonB=>@user2.id, :Timestamp=>"2010-01-01T10:00:00Z", :deltime=>"10")
    end

    describe "valid parameters" do
        it "should pass" do
          get '/api/writeInteraction', @valid_request
          Interaction.where(:Loclatitude => "2", :loclongitude =>"2", :PersonA=>@app_usr.id , :PersonB=>@user2.id, :deltime=>"10").should exist
        end
        end

      describe "invalid latitude" do
        it "should fail" do
          get '/api/writeInteraction', @valid_request.merge(:Loclatitude=>"180")
          Interaction.where(:Loclatitude => "180", :loclongitude =>"2", :PersonA=>@app_usr.id , :PersonB=>@user2.id, :deltime=>"10").should_not exist
        end
        end

        describe "invalid longitude" do
        it "should fail" do
          get '/api/writeInteraction', @valid_request.merge(:loclongitude=>"360")
          Interaction.where(:Loclatitude => "2", :loclongitude =>"360", :PersonA=>@app_usr.id , :PersonB=>@user2.id, :deltime=>"10").should_not exist
        end
        end

  end
end

