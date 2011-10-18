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
        itemdesc = Factory(:item_description)
        item1 = Factory(:item_global_1)
        item2 = Factory(:item_global_2)
        @item_ids = [item1[:id], item2[:id]]
        item3 = Factory(:item_owned_1)
        get '/api/getItemsNearBy', valid_api_params.merge(@coordinates)
        @result = JSON.parse(response.body)
      end
      it "should return a list of world owned items" do
        @result.each{|key| key["id"].should be_in @item_ids }
      end
      it "should return real items" do
        @result.each{|key| 
          search = Item.where(:id => key["id"])
          search.should exist
          key["distance"].should_not == nil
          key["item_description_id"].should == search.first[:item_description_id]
        }
      end
   
  
      
   end
  end
end

