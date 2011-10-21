require 'spec_helper'

describe "API" do

  before(:each) do
    app_usr = Factory(:Iphone)
    usr = Factory(:user)
    @valid_api_params = {:appKey => app_usr.api_key, :apiKey => usr.api_key}
  end

  it 'should get an image by a valid id and should return a url' do
    img = Factory(:image)

    get '/api/getImage', @valid_api_params.merge(:id => img.id)
    response.body.should == "/icons/original/missing.png"
  end

  it 'getImage without appKey should fail' do
    img = Factory(:image)

    get '/api/getImage', @valid_api_params.merge(:id => img.id, :appKey => '')
    response.status.should be 302
  end

  it 'get description by an invalid id should return an item description' do
    get '/api/getImage', @valid_api_params.merge(:id => 100)
    response.status.should be 404
  end

end