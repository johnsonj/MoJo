class AddTypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :type, :string
    remove_column :users, :phoneinformation
  end
end
