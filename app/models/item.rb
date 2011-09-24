class Item < ActiveRecord::Base
  has_one :Image
  has_one :User
  has_many :ItemHistory
end
