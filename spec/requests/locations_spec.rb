require 'spec_helper'

describe "API" do
  before(:each) do
	@location1 = Factory(:location_set_1)
	@location2 = Factory(:location_set_2)
	@location3 = Factory(:location_set_3)
	@location4 = Factory(:location_set_4)
	@location5 = Factory(:location_set_5)
	@location6 = Factory(:location_set_6)
	@interaction_usr = Factory(:user_app_interactions)
	@valid_api_key = {:appKey => @interaction_usr.api_key}
  end

    describe "getLocationsForRange" do
       describe "with valid parameters" do
          before(:each) do
            @start_end = {:start => "2010-01-01T11:00:00Z", :end => "2010-01-01T13:00:00Z"}
            @valid_params = @start_end.merge(@valid_api_key)
          end
          describe "locations within start and end" do
             describe "having count=true" do
                it "should return correct count" do
                   get 'api/getLocationsForRange', @valid_params.merge(:count => "true")
                   response.body.should be == "2"
                end
             end
             before(:each) do
                @location_ids_in_list = [@location2[:id], @location3[:id]]
                @location_ids_not_in_list = [@location1[:id], @location4[:id], @location5[:id], @location6[:id]]
                get 'api/getLocationsForRange', @valid_params.merge(:count => "false")
                @result = JSON.parse(response.body)
             end
             describe "having count = false" do
                it "should include correct locations" do
                   @result.each{|key| key["id"].should be_in @location_ids_in_list }
                end
                it "should not include incorrect locations" do
                   @result.each{|key| key["id"].should_not be_in @location_ids_not_in_list }
                end
             end
          end
    
       end
       describe "with invalid parameters" do
          describe "invalid range" do
    
             it "should return empty list" do
                @start_end = {:start => "2010-01-01T13:00:00Z", :end => "2010-01-01T11:00:00Z"}
                @valid_params = @start_end.merge(@valid_api_key)
                get 'api/getLocationsForRange', @valid_params.merge(:count => "false")
                JSON.parse(response.body).should be == []
             end
          end
       end
    end


end