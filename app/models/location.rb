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

  after_initialize :default_values
  def default_values
    self.timestamp = DateTime.current() 
  end
  def self.ping(params={})
    location = Location.new()
    location.user = params[:user]
    location.latitude = params[:latitude]
    location.longitude = params[:longitude]
    result = location.save()
  end

end 
