require "spec_helper"

describe UsersController do
  describe "api routing" do
    it "routes to register user" do
      get("/api/registerUser").should route_to("users#create", :format => "json")
    end
  end
end
