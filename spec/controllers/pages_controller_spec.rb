require 'spec_helper'

describe PagesController do

  before(:each) do
    log_in_test Factory(:user)
  end

  describe "GET 'leaderboards'" do
    it "should be successful" do
      get 'leaderboards'
      response.should be_success
    end
  end

end
