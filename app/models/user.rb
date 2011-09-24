class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation, :sex, :age, :phoneinformation, :bagtype_id

  has_secure_password

  has_one :bagtype
  has_many :location
  has_many :interaction

  validates_presence_of :password, :on => :create

end
