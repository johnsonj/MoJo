class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :sex, :age, :phoneinformation

  has_secure_password

  has_many :location
  has_many :interaction
  has_and_belongs_to_many :infectionatorrequests

  validates_presence_of :password, :on => :create

end
