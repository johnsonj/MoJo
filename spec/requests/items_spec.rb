require 'spec_helper'

describe "API" do
  before(:each) do
    @app_usr = Factory(:Iphone)
    @usr = Factory(:user)
    @valid_api_params = {:appKey => @app_usr.api_key, :apiKey => @usr.api_key}
  end
  
  describe "getItemsNearBy" do
    describe "with invalid coordinates" do
      before (:each) do
        @coordinates = {:latitude => 200, :longitude => 200}
        get '/api/getItemsNearBy', @valid_api_params.merge(@coordinates)
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
        get '/api/getItemsNearBy', @valid_api_params.merge(@coordinates)
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
  
  describe "pickupItem" do
     before (:each) do
        @coordinates = {:latitude => 1, :longitude => 1}
        itemdesc = Factory(:item_description)
        @item1 = Factory(:item_global_1)
        @item2 = Factory(:item_global_2)
        @item3 = Factory(:item_owned_1)
      end
      
      describe "with invalid coordinates" do
        before (:each) do
          @coordinates = {:latitude => 200, :longitude => 200}
          get '/api/pickupItem', @valid_api_params.merge(@coordinates).merge(:id => @item1.id)
        end

        it "should return blank for invalid coordinates" do
          response.body.should == "-1"
        end
         it "should not create a new location object" do
            Location.where(@coordinates).should == []
         end
     end
     describe "with valid coordinates" do
       describe "with a world owned item" do
         it "should fail when not near by" do
           @coordinates = {:latitude => 40, :longitude => 40}
           get '/api/pickupItem', @valid_api_params.merge(@coordinates).merge(:id => @item1.id)
           response.body.should == "-1"
         end
         describe "when near by" do
           before (:each) do
             get '/api/pickupItem', @valid_api_params.merge(@coordinates).merge(:id => @item1.id)
           end
           it "should return sucessful" do
             response.body.should == "1"
           end
           it "should change the item to owned" do
             search = Item.where(:id => @item1.id)
             search.should exist
             search.first[:user_id].should == @usr.id
           end
           it "should create item history"
         end
       end
       describe "with a user owned item" do
         it "should fail" do
           get '/api/pickupItem', @valid_api_params.merge(@coordinates).merge(:id => @item3.id)
           response.body.should == "-1"
         end
       end
       
     end
  end
  
  describe "dropItem" do
     before (:each) do
        @item_global_1 = Factory(:item_global_1)
        @item_global_2 = Factory(:item_global_2)
        @item_owned_1 = Factory(:item_owned_1, :user_id => @usr.id) 
     end
    describe "with valid coordinates" do
      def coordinates
        {:latitude => 1, :longitude => 1}
      end
      describe "with a valid, user owned item" do
      def params
        @valid_api_params.merge(coordinates).merge(:id => @item_owned_1.id, :signature => "Hey there")
      end
        before (:each) do
          get '/api/dropItem', params        
        end
        it "should return sucessful" do
          response.body.should == "1"
        end
        it "should assign the item to the world" do
          Item.where(:id => @item_owned_1.id).first.user_id.should == 0
        end
        it "should create item history" do
          history = ItemHistory.where(:item_id => @item_owned_1.id).first
          history.should_not == nil
          history.signature.should == params[:signature]
          history.latitude.should == params[:latitude]
          history.longitude.should == params[:longitude]
        end
        it "should create item history with a valid distance traveled"
      end
      describe "with a world owned item" do
        it "should not return sucessful"
        it "should not create item history"
      end
    end
  end
end

