require 'spec_helper'

describe PagesController do

  describe "GET 'leaderboards'" do
    it "should be successful" do
      get 'leaderboards'
      response.should be_success
    end
  end

end
