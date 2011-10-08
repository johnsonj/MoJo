require "spec_helper"

describe ImagesController do
  describe "api routing" do
    it "routes to image show" do
        get("/api/getImage").should route_to("images#show", :format => "json")
    end
  end

  describe "routing" do

    it "routes to #index" do
      get("/images").should route_to("images#index")
    end

    it "routes to #new" do
      get("/images/new").should route_to("images#new")
    end

    it "routes to #show" do
      get("/images/1").should route_to("images#show", :id => "1")
    end

    it "routes to #edit" do
      get("/images/1/edit").should route_to("images#edit", :id => "1")
    end

    it "routes to #create" do
      post("/images").should route_to("images#create")
    end

    it "routes to #update" do
      put("/images/1").should route_to("images#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/images/1").should route_to("images#destroy", :id => "1")
    end

  end
end
