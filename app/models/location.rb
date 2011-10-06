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
  validates_numericality_of :latitude, :less_than => 90, :greater_than => -90
  validates_numericality_of :longitude, :less_than => 180, :greater_than => -180
	validates :timestamp, :presence => true
  validates :user_id, :presence => true

  after_initialize :default_values
  def default_values
    self.timestamp = DateTime.current() if !self.timestamp 
  end
  def self.record_location(params={})
    location = Location.new()
    location.user = params[:user]
    location.latitude = params[:latitude]
    location.longitude = params[:longitude]
    result = location.save()
  end

end 
