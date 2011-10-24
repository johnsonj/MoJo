require 'spec_helper'

describe "API" do
  before(:each) do
	  @loc1 = Factory(:location_set_1)
    @loc2 = Factory(:location_set_2)
    @loc3 = Factory(:location_set_3)
    @loc4 = Factory(:location_set_4)
    @loc5 = Factory(:location_set_5)
    @loc6 = Factory(:location_set_6)

  end

  describe "getLocationsInRange" do
    before(:each) do
    @valid_request =  (:Loclatitude => "2", :loclongitude =>"2", :PersonA=>"1" , :PersonB=>"2", :Timestamp=>"2010-01-01T10:00:00Z", :deltime=>"10")
    end

    describe "valid parameters" do
        it "should pass" do
          get '/api/writeInteraction', @valid_request
          Interaction.where(@valid_interaction).should exist
        end
        end
    end

end