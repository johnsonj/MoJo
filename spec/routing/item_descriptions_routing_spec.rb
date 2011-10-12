require "spec_helper"

describe ItemDescriptionsController do
  describe "routing" do


    it "routes to #index" do
      get("/item_descriptions").should route_to("item_descriptions#index")
    end

    it "routes to #new" do
      get("/item_descriptions/new").should route_to("item_descriptions#new")
    end

    it "routes to #show" do
      get("/item_descriptions/1").should route_to("item_descriptions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/item_descriptions/1/edit").should route_to("item_descriptions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/item_descriptions").should route_to("item_descriptions#create")
    end

    it "routes to #update" do
      put("/item_descriptions/1").should route_to("item_descriptions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/item_descriptions/1").should route_to("item_descriptions#destroy", :id => "1")
    end

  end
end
