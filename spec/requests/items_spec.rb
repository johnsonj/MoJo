require 'spec_helper'

describe "API" do
  def valid_api_params
    app_usr = Factory(:Iphone)
    usr = Factory(:user)
    {:appKey => app_usr.api_key, :apiKey => usr.api_key}
  end
  
  describe "getItemsNearBy" do
    describe "with invalid coordinates" do
      before (:each) do
        @coordinates = {:latitude => 200, :longitude => 200}
        get '/api/getItemsNearBy', valid_api_params.merge(@coordinates)
      end
      
      it "should return blank for invalid coordinates" do
        response.body.should == [].to_json
      end
       it "should not create a new location object" do
          Location.where(@coordinates).should == []
       end
   end
   describe "with valid coordinates" do
      before (:each) do
        @coordinates = {:latitude => 1, :longitude => 1}
        get '/api/getItemsNearBy', valid_api_params.merge(@coordinates)
      end
      it "should return a list of world owned items" do
        result = JSON.parse(response.body)
        result.each{|key, value| value[:id].should == 0 }
      end
      
   end
  end
end

