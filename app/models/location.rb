class Location < ActiveRecord::Base
	has_one :location_type
	belongs_to :user
end
