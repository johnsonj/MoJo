# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Interaction do
  before(:each) do
    @valid = Factory.build(:valid_interaction)
  end

  it "should save a valid interaction" do
    @valid.save.should be true
  end
  
  it "should require a latitude" do
    @valid.Loclatitude = ""
    @valid.save.should_not be true
  end
  it "should require a longitude" do
    @valid.loclongitude = ""
    @valid.save.should_not be true
  end
  it "should require a valid latitude" do
    @valid.Loclatitude = 200
    @valid.save.should_not be true
    @valid.Loclatitude = -200
    @valid.save.should_not be true
  end
  it "should require a valid longitude" do
    @valid.loclongitude = 200
    @valid.save.should_not be true
    @valid.loclongitude = -200
    @valid.save.should_not be true
  end
  it "should require a PersonA" do
    @valid.PersonA = ""
    @valid.save.should_not be true
  end
  it "should require a PersonB" do
    @valid.PersonB = ""
    @valid.save.should_not be true    
  end
  it "should not allow PersonA to equal PersonB" do
    @valid.PersonA = @valid.PersonB
    @valid.save.should_not be true
  end
  it "should require a timestamp" do
    @valid.Timestamp = ""
    @valid.save.should_not be true
  end
  
end

