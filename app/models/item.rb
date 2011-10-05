# == Schema Information
#
# Table name: items
#
#  id          :integer         primary key
#  user_id     :integer
#  name        :string(255)
#  description :text
#  latitude    :float
#  longitude   :float
#  image_id    :integer
#  rarity      :integer
#  created_at  :timestamp
#  updated_at  :timestamp
#

class Item < ActiveRecord::Base

  has_one :Image
  belongs_to :User
  has_many :ItemHistory, :order => "stamp DESC", :limit => 30

  def self.NEAR_BY_DISTANCE
    @NEAR_BY_DISTANCE = 0.1
  end
  reverse_geocoded_by :latitude, :longitude

end


