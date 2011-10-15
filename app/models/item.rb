# == Schema Information
#
# Table name: items
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  name        :string(255)
#  description :text
#  latitude    :float
#  longitude   :float
#  image_id    :integer
#  rarity      :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Item < ActiveRecord::Base


  belongs_to :User
  belongs_to :item_description, :foreign_key => "item_description_id"
  has_many :ItemHistory, :order => "stamp DESC", :limit => 30

  validates :item_description_id, :presence => true
  validates_numericality_of :latitude, :less_than => 90, :greater_than => -90
  validates_numericality_of :longitude, :less_than => 180, :greater_than => -180

  reverse_geocoded_by :latitude, :longitude

end


