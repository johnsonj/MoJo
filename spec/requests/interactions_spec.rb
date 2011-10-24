require 'spec_helper'

describe "API" do
  before(:each) do
      @app_usr = Factory(:Iphone)
      @usr = Factory(:user)
      @valid_api_params = {:appKey => @app_usr.api_key, :apiKey => @usr.api_key}
  end

  describe "writeInteraction" do

    describe "asd" do
      it "should fail" do
	   
      end 
    end
  end



end


