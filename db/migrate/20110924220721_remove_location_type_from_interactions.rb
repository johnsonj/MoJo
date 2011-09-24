class RemoveLocationTypeFromInteractions < ActiveRecord::Migration
  def up
    remove_column :interactions, :LocationType
  end

  def down
    add_column :interactions, :LocationType
  end
end
