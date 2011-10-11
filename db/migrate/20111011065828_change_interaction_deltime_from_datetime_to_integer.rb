class ChangeInteractionDeltimeFromDatetimeToInteger < ActiveRecord::Migration
  def up
    add_column :interactions, :deltime_int, :integer
    Interaction.all.each do |interaction|
      interaction.deltime_int = interaction.deltime.to_i
      interaction.save
    end
    remove_column :interactions, :deltime
    rename_column :interactions, :deltime_int, :deltime
  end

  def down
  end
end
