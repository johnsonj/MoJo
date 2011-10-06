require "spec_helper"

describe ItemsController do
  describe "api routing" do
    it "routes to pickupItem" do
      get("/api/pickupItem").should route_to("items#pickup", :format => "json")
    end
    it "routes to dropItem" do
      get("/api/dropItem").should route_to("items#drop", :format => "json")
    end
    it "routes to getBackpackItems" do
      get("/api/getBackpackItems").should route_to("items#backpack", :format => "json")
    end
    it "routes to getItemsNearBy" do
      get("/api/getItemsNearBy").should route_to("items#nearby", :format => "json")
    end
  end

  describe "routing" do

    it "routes to #index" do
      get("/items").should route_to("items#index")
    end

    it "routes to #new" do
      get("/items/new").should route_to("items#new")
    end

    it "routes to #show" do
      get("/items/1").should route_to("items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/items/1/edit").should route_to("items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/items").should route_to("items#create")
    end

    it "routes to #update" do
      put("/items/1").should route_to("items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/items/1").should route_to("items#destroy", :id => "1")
    end

  end
end
