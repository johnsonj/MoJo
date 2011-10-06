require "spec_helper"

describe ItemHistoriesController do
  describe "api routing" do
    it "routes to get item details" do
      get("/api/getItemDetails").should route_to("item_histories#itemDetails", :format => "json")
    end
  end
  describe "routing" do

    it "routes to #index" do
      get("/item_histories").should route_to("item_histories#index")
    end

    it "routes to #new" do
      get("/item_histories/new").should route_to("item_histories#new")
    end

    it "routes to #show" do
      get("/item_histories/1").should route_to("item_histories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/item_histories/1/edit").should route_to("item_histories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/item_histories").should route_to("item_histories#create")
    end

    it "routes to #update" do
      put("/item_histories/1").should route_to("item_histories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/item_histories/1").should route_to("item_histories#destroy", :id => "1")
    end

  end
end
