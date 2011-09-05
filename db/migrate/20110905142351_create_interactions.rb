class CreateInteractions < ActiveRecord::Migration
  def self.up
    create_table :interactions do |t|
      t.float :Loclatitude
      t.float :loclongitude
      t.integer :LocationType
      t.integer :PersonA
      t.integer :PersonB
      t.datetime :Timestamp
      t.datetime :deltime

      t.timestamps
    end
  end

  def self.down
    drop_table :interactions
  end
end
