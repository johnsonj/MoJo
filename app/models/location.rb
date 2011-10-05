# == Schema Information
#
# Table name: locations
#
#  id         :integer         primary key
#  latitude   :float
#  longitude  :float
#  timestamp  :timestamp
#  user_id    :integer
#  created_at :timestamp
#  updated_at :timestamp
#

class Location < ActiveRecord::Base
	belongs_to :user
	validates :latitude, :presence => true
	validates :longitude, :presence => true
	validates :timestamp, :presence => true

  after_initialize :default_values
  def default_values
    self.timestamp = DateTime.current() if !self.timestamp 
  end
  def self.ping(params={})
    location = Location.new()
    location.user = params[:user]
    location.latitude = params[:latitude]
    location.longitude = params[:longitude]
    result = location.save()
  end

end 
