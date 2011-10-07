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

  has_one :Image
  belongs_to :User
  has_many :ItemHistory, :order => "stamp DESC", :limit => 30


validates :name, :length => { :minimum => 3 }
validates_numericality_of :longitude
validates_numericality_of :latitude

  def self.NEAR_BY_DISTANCE
    @NEAR_BY_DISTANCE = 0.1
  end
  reverse_geocoded_by :latitude, :longitude

end


