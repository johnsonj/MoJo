require "spec_helper"

describe BagtypesController do
  describe "routing" do

    it "routes to #index" do
      get("/bagtypes").should route_to("bagtypes#index")
    end

    it "routes to #new" do
      get("/bagtypes/new").should route_to("bagtypes#new")
    end

    it "routes to #show" do
      get("/bagtypes/1").should route_to("bagtypes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bagtypes/1/edit").should route_to("bagtypes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bagtypes").should route_to("bagtypes#create")
    end

    it "routes to #update" do
      put("/bagtypes/1").should route_to("bagtypes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bagtypes/1").should route_to("bagtypes#destroy", :id => "1")
    end

  end
end
