class AddBagTypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :bagtype_id, :integer
  end
end
