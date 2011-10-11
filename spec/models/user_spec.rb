require 'spec_helper'

describe User do
  before (:each) do
    @valid_user = Factory(:user)
    @attr = {:username => @valid_user.username, :age => @valid_user.age, :sex => @valid_user.sex, :email => @valid_user.email, :password => @valid_user.password, :api_key => @valid_user.api_key }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end

  it "should require a username" do
    User.new(@attr.merge(:username => "")).should_not be_valid
  end

  it "should require an age" do
    User.new(@attr.merge(:age => "")).should_not be_valid
  end

  it "should require a sex" do
    User.new(@attr.merge(:sex => "")).should_not be_valid
  end

  it "should require an email" do
    User.new(@attr.merge(:email => "")).should_not be_valid
  end


  it "should require a password" do
    User.new(@attr.merge(:password => "")).should_not be_valid
  end
  
  it "should return a valid user by APIKey" do
    @usr = User.new(@attr)
    @search = User.getByApiKey(@attr[:api_key])
    @search.username.should == @usr.username
    @search.email.should == @usr.email
    @search.age.should == @usr.age
    @search.sex.should == @usr.sex
  end
end
