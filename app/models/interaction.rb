class Interaction < ActiveRecord::Base
	has_one :locationtype
	has_one :persona, :class_name => "User", :foreign_key => "id", :primary_key => "PersonA"
	has_one :personb, :class_name => "User", :foreign_key => "id", :primary_key => "PersonB"
#	@pa = @interaction.persona
end
