class CreateLocationtypes < ActiveRecord::Migration
  def self.up
    create_table :locationtypes do |t|
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :locationtypes
  end
end
