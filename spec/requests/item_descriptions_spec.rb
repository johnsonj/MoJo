require 'spec_helper'

describe "API" do

  def valid_api_params
    app_usr = Factory(:Iphone)
    usr = Factory(:user)
    {:appKey => app_usr.api_key, :apiKey => usr.api_key}
  end

  it 'get description by a valid id should return an item description' do
    desc = Factory(:item_description)

    get '/api/getItemDescription', valid_api_params.merge(:id => desc.id)
    response.body.should == desc.to_json
  end

  it 'get description without appKey should fail' do
    desc = Factory(:item_description)

    get '/api/getItemDescription', valid_api_params.merge(:id => desc.id, :appKey => '')
    response.status.should be 302
  end

  it 'get description by an invalid id should return an item description' do
    desc = Factory(:item_description)

    get '/api/getItemDescription', valid_api_params.merge(:id => 100)
    response.status.should be 404
  end

end