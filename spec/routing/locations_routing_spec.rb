require "spec_helper"

describe LocationsController do
  describe "api routing" do
  
    it "routes to locationPing" do
      get("/api/locationPing").should route_to("locations#record_location", :format => "json")
    end
  end
end
