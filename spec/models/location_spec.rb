require 'spec_helper'

describe Location do
  before (:each) do 
    @valid_location = Factory(:location)
    @attr = {:latitude => @valid_location.latitude, :longitude => @valid_location.longitude, :user_id => @valid_location.user_id }
  end

  it "should create a new instance given valid attribues" do
    Location.create!(@attr)
  end

  it "should require a latitude" do
    Location.new(@attr.merge(:latitude => "")).should_not be_valid
  end
  it "should require a longitude" do
    Location.new(@attr.merge(:longitude => "")).should_not be_valid
  end


  it "should require a valid latitude" do
    Location.new(@attr.merge(:latitude => "-2000")).should_not be_valid
    Location.new(@attr.merge(:latitude => "2000")).should_not be_valid
  end

  it "should require a valid longitude" do
    Location.new(@attr.merge(:longitude => "-2000")).should_not be_valid
    Location.new(@attr.merge(:longitude => "2000")).should_not be_valid
  end

  it "should require a user" do
    Location.new(@attr.merge(:user_id => "")).should_not be_valid
  end


  it "should create a timestamp" do
    Location.new(@attr).timestamp.should_not be nil
  end

end
