class ChangeRarityToInt < ActiveRecord::Migration
  def up
    descriptions = Hash.new
    ItemDescription.all.each do |desc|
      rare = desc.rarity.to_i
      descriptions[desc.name] = rare
    end
    remove_column :item_descriptions, :rarity
    add_column :item_descriptions, :rarity, :integer
    ItemDescription.all.each do |desc|
      desc.rarity = descriptions[desc.name]
      desc.save
    end
  end

  def down
    #fuck going back
  end
end
