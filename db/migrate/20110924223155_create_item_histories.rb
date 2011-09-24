class CreateItemHistories < ActiveRecord::Migration
  def change
    create_table :item_histories do |t|
      t.integer :user_id
      t.integer :item_id
      t.float :latitude
      t.float :longitude
      t.string :signature
      t.timestamp :stamp
      t.integer :runningdistance

      t.timestamps
    end
  end
end
