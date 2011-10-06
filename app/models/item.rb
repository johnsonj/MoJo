# == Schema Information
#
# Table name: items
#
#  id             :integer         not null, primary key
#  user_id        :integer
#  latitude       :float
#  longitude      :float
#  created_at     :datetime
#  updated_at     :datetime
#  description_id :integer
#

class Item < ActiveRecord::Base

  belongs_to :User
  has_many :ItemHistory, :order => "stamp DESC", :limit => 30

  def self.NEAR_BY_DISTANCE
    @NEAR_BY_DISTANCE = 0.1
  end
  reverse_geocoded_by :latitude, :longitude

end


