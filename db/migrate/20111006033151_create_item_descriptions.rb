class CreateItemDescriptions < ActiveRecord::Migration
  def change
    create_table :item_descriptions do |t|
      t.string :name
      t.text :description
      t.string :rarity
      t.integer :image_id
      t.timestamps
    end
    add_column :items, :description_id, :integer
    Item.all.each do |item|
      desc = ItemDescription.find_by_name(item.name)
      if (desc)
        item.update_attribute :description_id, desc.id
        item.save
      else
        description = {:name => item.name, :description => item.description, :rarity => item.rarity,
                       :image_id => item.image_id}
        desc = ItemDescription.new(description)
        desc.save
        item.update_attribute :description_id, desc.id
        item.save
        puts item.errors
      end
    end

    remove_column :items, :name
    remove_column :items, :description
    remove_column :items, :image_id
    remove_column :items, :rarity

  end
end
