# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  username        :string(255)
#  age             :integer
#  sex             :integer
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  email           :string(255)
#  bagtype_id      :integer
#  api_key         :text
#  user_type       :string(255)     default("normal"), not null
#

class User < ActiveRecord::Base

  def self.WORLD_USER_ID
    @WORLD_USER_ID ||= 0
  end

  attr_accessible :email, :username, :password, :password_confirmation, :sex, :age, :bagtype_id

  has_secure_password

  has_one :bagtype
  has_many :location
  has_many :interaction
  has_many :items

  validates_presence_of :password, :on => :create
  validates_inclusion_of :user_type, :in => [:normal, :admin, :app, :interactions]

  def self.getByApiKey(key)
    if key.blank?
      nil
    else
      User.find_by_api_key(key)
    end
  end

  def user_type
    read_attribute(:user_type).to_sym
  end

  def user_type= (value)
    write_attribute(:user_type, value.to_s)
  end

end
