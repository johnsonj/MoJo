class DescriptionIdRename < ActiveRecord::Migration
  def up
  end

  def down
  end

  def change
    rename_column :items, :description_id, :item_description_id
  end
end
