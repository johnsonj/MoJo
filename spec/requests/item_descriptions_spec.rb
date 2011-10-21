require 'spec_helper'

describe "API" do

  before(:each) do
    app_usr = Factory(:Iphone)
    usr = Factory(:user)
    @valid_api_params = {:appKey => app_usr.api_key, :apiKey => usr.api_key}
  end
  describe 'getDescription' do
    it 'get description by a valid id should return an item description' do
      desc = Factory(:item_description)

      get '/api/getItemDescription', @valid_api_params.merge(:id => desc.id)
      response.body.should == desc.to_json
    end

    it 'get description without appKey should fail' do
      desc = Factory(:item_description)

      get '/api/getItemDescription', @valid_api_params.merge(:id => desc.id, :appKey => '')
      response.status.should be 302
    end

    it 'get description by an invalid id should return an item description' do
      desc = Factory(:item_description)

      get '/api/getItemDescription', @valid_api_params.merge(:id => 100)
      response.status.should be 404
    end
  end

  describe "getDescriptionUpdates" do

    it 'should return only updates after a sent date' do
      desc1 = Factory(:item_description)
      desc2 = Factory(:item_description2)
      time = Date.tomorrow.to_datetime
      desc2.updated_at = time
      desc2.save
      get '/api/getDescriptionUpdates', @valid_api_params.merge(:dateTime => time)
      response.body.should == ItemDescription.where(:id => desc2.id).to_json
    end

    it 'should send all the descriptions if the date is blank' do
      desc1 = Factory(:item_description)
      desc2 = Factory(:item_description2)
      descriptions = ItemDescription.all
      get '/api/getDescriptionUpdates', @valid_api_params.merge(:dateTime => '')
      response.body.should == descriptions.to_json
    end

    it 'should send confirm if there are no updates' do
      time = Date.tomorrow.to_datetime
      get '/api/getDescriptionUpdates', @valid_api_params.merge(:dateTime => time)
      response.body.should == 'No Updates Found'
      response.status.should be 200
    end

    it 'should fail without a valid app key' do
      get '/api/getDescriptionUpdates', @valid_api_params.merge(:id => 1, :appKey => '')
      response.status.should be 302
    end

  end

  describe "getItemDetails" do
    it "should fail for an invalid item" do
      get "/api/getItemDetails", @valid_api_params.merge(:id => 200)
      response.status.should == 404
    end

    it "should return an item when passed a valid id" do
      item = Factory(:item_global_1)
      hist = Factory(:item_history, :item_id => item.id)
      get "/api/getItemDetails", @valid_api_params.merge(:id => item.id)
      response.body.should == [hist].to_json(:only => [:id, :item_id, :latitude, :longitude, :runningdistance, :signature, :stamp, :user_id])
    end
    end

end