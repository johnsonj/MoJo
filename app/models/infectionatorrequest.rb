class Infectionatorrequest < ActiveRecord::Base
	has_one :bug
  	has_and_belongs_to_many :users
end
