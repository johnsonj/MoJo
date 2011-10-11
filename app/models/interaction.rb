# == Schema Information
#
# Table name: interactions
#
#  id           :integer         primary key
#  Loclatitude  :float
#  loclongitude :float
#  PersonA      :integer
#  PersonB      :integer
#  Timestamp    :timestamp
#  deltime      :timestamp
#  created_at   :timestamp
#  updated_at   :timestamp
#

class Interaction < ActiveRecord::Base
	has_one :persona, :class_name => "User", :foreign_key => "id", :primary_key => "PersonA"
	has_one :personb, :class_name => "User", :foreign_key => "id", :primary_key => "PersonB"
  
  validates_numericality_of :Loclatitude, :less_than => 90, :greater_than => -90
  validates_numericality_of :loclongitude, :less_than => 180, :greater_than => -180
  validates :PersonA, :presence => true
  validates :PersonB, :presence => true
  validates_each :PersonA, :PersonB do |model, attr, value|
    model.errors.add(attr, "must be unique value between PersonA, PersonB") if model.PersonA == model.PersonB
  end
  
  validates :Timestamp, :presence => true
  validates :deltime, :presence => true

end