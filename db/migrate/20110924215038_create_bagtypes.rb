class CreateBagtypes < ActiveRecord::Migration
  def change
    create_table :bagtypes do |t|
      t.integer :size
      t.string :name

      t.timestamps
    end
  end
end
