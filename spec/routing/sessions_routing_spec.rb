require "spec_helper"

describe SessionsController do
  describe "api routing" do
    it "routes to login" do
      get("/api/login").should route_to("sessions#create", :format => "json")
    end
    it "routes to logout" do
      get("/api/logout").should route_to("sessions#destroy", :format => "json")
    end
  end
end
