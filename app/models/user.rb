class User < ActiveRecord::Base
  	has_and_belongs_to_many :infectionatorrequests
	has_many :location
	has_many :interaction
end
