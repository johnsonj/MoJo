# == Schema Information
#
# Table name: interactions
#
#  id           :integer         not null, primary key
#  Loclatitude  :float
#  loclongitude :float
#  PersonA      :integer
#  PersonB      :integer
#  Timestamp    :datetime
#  deltime      :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

class Interaction < ActiveRecord::Base
	has_one :persona, :class_name => "User", :foreign_key => "id", :primary_key => "PersonA"
	has_one :personb, :class_name => "User", :foreign_key => "id", :primary_key => "PersonB"
#	@pa = @interaction.persona
end
