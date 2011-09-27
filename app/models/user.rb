# == Schema Information
#
# Table name: users
#
#  id               :integer         not null, primary key
#  username         :string(255)
#  age              :integer
#  sex              :integer
#  password_digest  :string(255)
#  phoneinformation :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  email            :string(255)
#  bagtype_id       :integer
#

class User < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation, :sex, :age, :phoneinformation, :bagtype_id

  has_secure_password

  has_one :bagtype
  has_many :location
  has_many :interaction

  validates_presence_of :password, :on => :create
  validates :username, :length => { :maximum => 20 }

end
