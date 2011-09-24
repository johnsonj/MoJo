class ItemHistory < ActiveRecord::Base
  belongs_to :Item
  has_one :User
end
