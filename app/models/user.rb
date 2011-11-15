# == Schema Information
#
# Table name: users
#
#  id              :integer         primary key
#  username        :string(255)
#  age             :integer
#  sex             :integer
#  password_digest :string(255)
#  created_at      :timestamp
#  updated_at      :timestamp
#  email           :string(255)
#  bagtype_id      :integer
#  api_key         :text
#  user_type       :string(255)     default("normal"), not null
#

class User < ActiveRecord::Base

  attr_accessible :email,                 :username,  :password,
                  :password_confirmation, :sex,       :age,
                  :bagtype_id,            :user_type, :api_key

  has_secure_password

  has_one :bagtype
  has_many :location
  has_many :interaction
  has_many :items
  has_many :item_histories

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username,
            :presence => true,
            :length => {:maximum => 40},
            :uniqueness => { :case_sensitive => false }

  validates :email,
            :presence => true,
            :uniqueness => { :case_sensitive => false },
            :format => {:with => email_regex}

  validates :password,
            :presence => true,
            :confirmation => true,
            :length => {:within => 6..40},
            :on => :create

  validates_presence_of :age, :sex, :on => :create
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
