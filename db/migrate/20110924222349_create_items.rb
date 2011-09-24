class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.float :latitude
      t.float :longitude
      t.integer :image_id
      t.integer :rarity

      t.timestamps
    end
  end
end
