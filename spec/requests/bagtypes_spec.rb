require 'spec_helper'

describe "Bagtypes" do
  describe "GET /bagtypes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get bagtypes_path
      response.status.should be(200)
    end
  end
end
