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
#	@pa = @interaction.persona
end
