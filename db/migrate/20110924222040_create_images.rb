class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.binary :image

      t.timestamps
    end
  end
end
