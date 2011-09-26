# == Schema Information
#
# Table name: locations
#
#  id         :integer         not null, primary key
#  latitude   :float
#  longitude  :float
#  timestamp  :datetime
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Location < ActiveRecord::Base
	belongs_to :user
	validates :latitude, :presence => true
	validates :longitude, :presence => true
	validates :timestamp, :presence => true
end
