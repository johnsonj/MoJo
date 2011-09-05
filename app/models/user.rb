class User < ActiveRecord::Base
	validates :content
  has_and_belongs_to_many :infectionatorrequests
end
